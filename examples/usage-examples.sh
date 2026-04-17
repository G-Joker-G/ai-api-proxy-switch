#!/bin/bash
# AI API Proxy Switch Skill 使用示例脚本
# 展示技能的各种用法

set -e

echo "=== AI API Proxy Switch Skill 示例 ==="
echo ""

# 检查环境变量
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "错误: OPENROUTER_API_KEY 未设置"
    echo "请先设置环境变量或运行: source references/quick-setup.sh"
    exit 1
fi

echo "✅ API Key 已配置"
echo ""

# 示例1: 基本使用
echo "=== 示例1: 基本使用 ==="
echo "使用 GPT-5.2 进行简单推理"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '如果3个人3天能完成一项工作，那么6个人需要多少天？'"
echo ""

# 示例2: 创意写作
echo "=== 示例2: 创意写作 ==="
echo "使用 Claude-Sonnet 进行创意写作"
echo "命令: hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query '写一首关于人工智能的四行诗'"
echo ""

# 示例3: 代码生成
echo "=== 示例3: 代码生成 ==="
echo "使用 GPT-5.3-Codex 生成代码"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gpt-5.3-codex --query '用 Python 写一个快速排序算法'"
echo ""

# 示例4: 深度分析
echo "=== 示例4: 深度分析 ==="
echo "使用 Gemini 深度思考模式进行分析"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gemini-3.1-pro-preview-thinking --query '分析区块链技术在供应链管理中的应用前景'"
echo ""

# 示例5: 技能内置命令
echo "=== 示例5: 技能内置命令 ==="
echo "5.1 测试连接"
echo "命令: hermes chat --skills ai-api-proxy-switch --query '/test-connection'"
echo ""
echo "5.2 查看可用模型"
echo "命令: hermes chat --skills ai-api-proxy-switch --query '/list-models'"
echo ""
echo "5.3 显示配置"
echo "命令: hermes chat --skills ai-api-proxy-switch --query '/show-config'"
echo ""

# 示例6: 批量处理
echo "=== 示例6: 批量处理 ==="
cat > /tmp/questions.txt << 'EOF'
1. 解释什么是机器学习
2. 列出三种常见的机器学习算法
3. 机器学习的主要应用领域有哪些
EOF

echo "批量处理多个问题:"
echo "命令:"
echo "  while read -r question; do"
echo "    echo '问题: \$question'"
echo "    hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query \"\$question\""
echo "    echo ''"
echo "  done < /tmp/questions.txt"
echo ""

# 示例7: 模型对比
echo "=== 示例7: 模型对比 ==="
echo "对比不同模型对同一问题的回答:"
echo "命令:"
echo "  QUESTION='解释什么是云计算'"
echo "  for model in gpt-5.2 claude-sonnet-4-6 gemini-3.1-pro-preview-thinking; do"
echo "    echo \"=== \$model ===\""
echo "    hermes chat --skills ai-api-proxy-switch --model \$model --query \"\$QUESTION\" | head -3"
echo "    echo ''"
echo "  done"
echo ""

# 示例8: 结合其他技能
echo "=== 示例8: 结合其他技能 ==="
echo "结合代码审查技能:"
echo "命令: hermes chat --skills ai-api-proxy-switch,code-review --model gpt-5.3-codex --query '审查以下 Python 代码...'"
echo ""

# 示例9: 交互式会话
echo "=== 示例9: 交互式会话 ==="
echo "启动交互式会话:"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gpt-5.2"
echo ""
echo "在交互式会话中，您可以:"
echo "1. 连续提问"
echo "2. 使用 /switch-model 命令切换模型"
echo "3. 使用 /help 查看帮助"
echo "4. 使用 /exit 退出"
echo ""

# 示例10: 输出格式化
echo "=== 示例10: 输出格式化 ==="
echo "10.1 输出为 JSON 格式"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '生成包含姓名、年龄、职业的 JSON 对象' | jq ."
echo ""
echo "10.2 提取特定信息"
echo "命令: hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '列出 Python 的5个主要特性' | grep -E '^[0-9]+\. '"
echo ""

echo "=== 运行实际示例 ==="
echo "是否运行示例1? (y/n)"
read -r run_example

if [ "$run_example" = "y" ] || [ "$run_example" = "Y" ]; then
    echo ""
    echo "运行示例1: 基本使用"
    echo "----------------------------------------"
    hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '如果3个人3天能完成一项工作，那么6个人需要多少天？请分步骤推理。'
    echo "----------------------------------------"
fi

echo ""
echo "=== 更多资源 ==="
echo "1. 详细文档: docs/DETAILED_GUIDE.md"
echo "2. 配置示例: examples/config.env.example"
echo "3. 快速配置: references/quick-setup.sh"
echo "4. 故障排除: 查看文档中的故障排除章节"
echo ""
echo "安装脚本: ./install.sh"
echo ""

exit 0