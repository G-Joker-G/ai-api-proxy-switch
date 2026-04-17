#!/bin/bash
# AI API Proxy Switch Skill 故障排除工具
# 诊断和解决常见问题

set -e

echo "=== AI API Proxy Switch Skill 故障排除工具 ==="
echo ""

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查函数
check_hermes() {
    echo "1. 检查 Hermes Agent..."
    if command -v hermes &> /dev/null; then
        echo -e "   ${GREEN}✅ Hermes Agent 已安装${NC}"
        hermes_version=$(hermes --version 2>/dev/null || echo "未知版本")
        echo "   版本: $hermes_version"
    else
        echo -e "   ${RED}❌ Hermes Agent 未安装${NC}"
        echo "   请先安装 Hermes Agent: https://github.com/NousResearch/Hermes"
        return 1
    fi
    echo ""
}

check_skill() {
    echo "2. 检查技能安装..."
    SKILL_DIR="$HOME/.hermes/skills/software-development/ai-api-proxy-switch"
    
    if [ -d "$SKILL_DIR" ]; then
        echo -e "   ${GREEN}✅ 技能目录存在${NC}"
        echo "   路径: $SKILL_DIR"
        
        # 检查关键文件
        files=("SKILL.md" "README.md" "references/quick-setup.sh")
        missing_files=()
        
        for file in "${files[@]}"; do
            if [ ! -f "$SKILL_DIR/$file" ]; then
                missing_files+=("$file")
            fi
        done
        
        if [ ${#missing_files[@]} -eq 0 ]; then
            echo -e "   ${GREEN}✅ 所有关键文件都存在${NC}"
        else
            echo -e "   ${YELLOW}⚠️  缺少文件: ${missing_files[*]}${NC}"
        fi
    else
        echo -e "   ${RED}❌ 技能目录不存在${NC}"
        echo "   请运行安装脚本: ./install.sh"
        return 1
    fi
    echo ""
}

check_env_vars() {
    echo "3. 检查环境变量..."
    
    # 检查 OPENROUTER_API_KEY
    if [ -z "$OPENROUTER_API_KEY" ]; then
        echo -e "   ${RED}❌ OPENROUTER_API_KEY 未设置${NC}"
        echo "   设置方法:"
        echo "     export OPENROUTER_API_KEY='你的_cla..._key'"
        echo "   或运行: source references/quick-setup.sh"
        return 1
    else
        echo -e "   ${GREEN}✅ OPENROUTER_API_KEY 已设置${NC}"
        echo "   值: ${OPENROUTER_API_KEY:0:10}..."
    fi
    
    # 检查 OPENROUTER_BASE_URL
    if [ -z "$OPENROUTER_BASE_URL" ]; then
        echo -e "   ${YELLOW}⚠️  OPENROUTER_BASE_URL 未设置，使用默认值${NC}"
        export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
        echo "   已设置: $OPENROUTER_BASE_URL"
    else
        echo -e "   ${GREEN}✅ OPENROUTER_BASE_URL 已设置${NC}"
        echo "   值: $OPENROUTER_BASE_URL"
    fi
    echo ""
}

check_network() {
    echo "4. 检查网络连接..."
    
    # 测试 API 端点
    if command -v curl &> /dev/null; then
        echo "   测试连接到 API 端点..."
        
        if curl -s --max-time 10 "$OPENROUTER_BASE_URL/models" > /dev/null 2>&1; then
            echo -e "   ${GREEN}✅ API 端点可访问${NC}"
        else
            echo -e "   ${RED}❌ 无法访问 API 端点${NC}"
            echo "   请检查网络连接或代理设置"
            return 1
        fi
    else
        echo -e "   ${YELLOW}⚠️  curl 未安装，跳过网络测试${NC}"
    fi
    echo ""
}

check_api_key() {
    echo "5. 验证 API Key..."
    
    if command -v curl &> /dev/null; then
        echo "   验证 API Key 有效性..."
        
        response=$(curl -s --max-time 10 \
            -H "Authorization: Bearer $OPENROUTER_API_KEY" \
            "$OPENROUTER_BASE_URL/models" \
            -w "%{http_code}")
        
        status_code="${response: -3}"
        
        case $status_code in
            200)
                echo -e "   ${GREEN}✅ API Key 有效${NC}"
                ;;
            401)
                echo -e "   ${RED}❌ API Key 无效或已过期${NC}"
                echo "   请检查 API Key 或访问 https://api.clawsocket.com"
                return 1
                ;;
            403)
                echo -e "   ${RED}❌ 权限不足${NC}"
                echo "   请检查账户状态和权限"
                return 1
                ;;
            *)
                echo -e "   ${YELLOW}⚠️  API 返回状态码: $status_code${NC}"
                echo "   响应: ${response%???}"
                ;;
        esac
    else
        echo -e "   ${YELLOW}⚠️  curl 未安装，跳过 API Key 验证${NC}"
    fi
    echo ""
}

run_test() {
    echo "6. 运行测试命令..."
    
    echo "   测试技能基本功能..."
    test_output=$(hermes chat --skills ai-api-proxy-switch --query "/test-connection" 2>&1)
    
    if echo "$test_output" | grep -q "连接成功\|Connection successful"; then
        echo -e "   ${GREEN}✅ 技能测试通过${NC}"
    elif echo "$test_output" | grep -q "错误\|Error\|失败\|Failed"; then
        echo -e "   ${RED}❌ 技能测试失败${NC}"
        echo "   错误信息:"
        echo "   $test_output" | tail -5
        return 1
    else
        echo -e "   ${YELLOW}⚠️  测试结果不确定${NC}"
        echo "   输出:"
        echo "   $test_output" | tail -3
    fi
    echo ""
}

show_summary() {
    echo "=== 诊断摘要 ==="
    echo ""
    
    if [ "$all_checks_passed" = true ]; then
        echo -e "${GREEN}✅ 所有检查通过！技能应该可以正常工作。${NC}"
        echo ""
        echo "下一步:"
        echo "1. 尝试基本使用:"
        echo "   hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '你好'"
        echo ""
        echo "2. 查看可用模型:"
        echo "   hermes chat --skills ai-api-proxy-switch --query '/list-models'"
        echo ""
        echo "3. 运行示例脚本:"
        echo "   ./examples/usage-examples.sh"
    else
        echo -e "${YELLOW}⚠️  发现一些问题，请根据上面的提示进行修复。${NC}"
        echo ""
        echo "常见解决方案:"
        echo "1. 设置环境变量: source references/quick-setup.sh"
        echo "2. 重新安装技能: ./install.sh"
        echo "3. 检查网络连接"
        echo "4. 验证 API Key: 访问 https://api.clawsocket.com"
        echo ""
        echo "更多帮助请查看文档: docs/DETAILED_GUIDE.md"
    fi
    echo ""
}

# 运行所有检查
all_checks_passed=true

check_hermes || all_checks_passed=false
check_skill || all_checks_passed=false
check_env_vars || all_checks_passed=false
check_network || all_checks_passed=false
check_api_key || all_checks_passed=false

# 只有前面的检查都通过才运行测试
if [ "$all_checks_passed" = true ]; then
    run_test || all_checks_passed=false
fi

show_summary

# 提供快速修复选项
echo "=== 快速修复选项 ==="
echo "1. 运行快速配置脚本"
echo "2. 重新安装技能"
echo "3. 查看详细文档"
echo "4. 退出"
echo ""
echo "请选择 (1-4): "
read -r option

case $option in
    1)
        echo "运行快速配置脚本..."
        source references/quick-setup.sh
        ;;
    2)
        echo "重新安装技能..."
        ./install.sh
        ;;
    3)
        echo "打开文档..."
        if command -v less &> /dev/null; then
            less docs/DETAILED_GUIDE.md
        else
            cat docs/DETAILED_GUIDE.md | head -50
        fi
        ;;
    4)
        echo "退出"
        ;;
    *)
        echo "无效选项"
        ;;
esac

exit 0