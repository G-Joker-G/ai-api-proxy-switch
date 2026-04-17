#!/bin/bash
# AI API Proxy Switch Skill 安装脚本
# 用法: ./install.sh

set -e

echo "=== AI API Proxy Switch Skill 安装程序 ==="
echo ""

# 检查 Hermes 是否安装
if ! command -v hermes &> /dev/null; then
    echo "错误: Hermes Agent 未安装"
    echo "请先安装 Hermes Agent: https://github.com/NousResearch/Hermes"
    exit 1
fi

echo "✅ Hermes Agent 已安装"

# 创建技能目录
SKILL_DIR="$HOME/.hermes/skills/software-development/ai-api-proxy-switch"
mkdir -p "$SKILL_DIR"

echo "📁 技能目录: $SKILL_DIR"

# 复制文件
echo "📋 复制文件..."
cp -r ./* "$SKILL_DIR/" 2>/dev/null || true

# 设置权限
chmod +x "$SKILL_DIR/references/quick-setup.sh"

echo "✅ 文件复制完成"

# 检查环境变量
echo ""
echo "=== 环境变量检查 ==="

if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "⚠️  未检测到 OPENROUTER_API_KEY 环境变量"
    echo ""
    echo "请按照以下步骤配置:"
    echo "1. 访问 https://api.clawsocket.com 注册账户"
    echo "2. 获取 API Key (格式为 cla_...)"
    echo "3. 设置环境变量:"
    echo ""
    echo "   临时设置:"
    echo "   export OPENROUTER_API_KEY='你的_cla..._key'"
    echo "   export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'"
    echo ""
    echo "   永久设置 (添加到 ~/.bashrc 或 ~/.zshrc):"
    echo "   echo 'export OPENROUTER_API_KEY=\"你的_cla..._key\"' >> ~/.bashrc"
    echo "   echo 'export OPENROUTER_BASE_URL=\"https://api.clawsocket.com/v1\"' >> ~/.bashrc"
    echo "   source ~/.bashrc"
else
    echo "✅ OPENROUTER_API_KEY 已设置"
fi

if [ -z "$OPENROUTER_BASE_URL" ]; then
    echo "⚠️  未检测到 OPENROUTER_BASE_URL，将使用默认值"
    export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
    echo "   已设置: export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'"
else
    echo "✅ OPENROUTER_BASE_URL 已设置: $OPENROUTER_BASE_URL"
fi

# 验证安装
echo ""
echo "=== 验证安装 ==="

if [ -f "$SKILL_DIR/SKILL.md" ]; then
    echo "✅ 技能文件已正确安装"
else
    echo "❌ 技能文件安装失败"
    exit 1
fi

# 显示使用说明
echo ""
echo "=== 安装完成 ==="
echo ""
echo "使用方法:"
echo "1. 基本使用:"
echo "   hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '你的问题'"
echo ""
echo "2. 测试连接:"
echo "   hermes chat --skills ai-api-proxy-switch --query '/test-connection'"
echo ""
echo "3. 查看可用模型:"
echo "   hermes chat --skills ai-api-proxy-switch --query '/list-models'"
echo ""
echo "4. 快速配置 (可选):"
echo "   source $SKILL_DIR/references/quick-setup.sh"
echo ""
echo "详细文档请查看:"
echo "   $SKILL_DIR/README.md"
echo "   $SKILL_DIR/docs/DETAILED_GUIDE.md"
echo ""
echo "如需帮助，请查看文档或提交 Issue:"
echo "   https://github.com/G-Joker-G/ai-api-proxy-switch/issues"

exit 0