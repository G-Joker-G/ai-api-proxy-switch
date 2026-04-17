#!/bin/bash
# AI API Proxy 快速配置脚本
# 用法：source quick-setup.sh

echo "=== AI API Proxy 快速配置 ==="
echo ""

# 检查是否已设置 API Key
if [ -z "$OPENROUTER_API_KEY" ]; then
    echo "⚠️  未检测到 OPENROUTER_API_KEY 环境变量"
    echo "请先设置你的 Clawsocket API Key："
    echo ""
    echo "临时设置（当前会话有效）："
    echo "  export OPENROUTER_API_KEY='你的_clawsocket_api_key'"
    echo ""
    echo "永久设置（添加到 ~/.bashrc 或 ~/.zshrc）："
    echo "  echo \"export OPENROUTER_API_KEY='你的_clawsocket_api_key'\" >> ~/.bashrc"
    echo "  source ~/.bashrc"
    echo ""
else
    echo "✅ 已检测到 OPENROUTER_API_KEY 环境变量"
fi

# 设置 base URL
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
echo "✅ 已设置 OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'"

echo ""
echo "=== 配置完成 ==="
echo ""
echo "使用方法："
echo "1. 使用技能（推荐）："
echo "   hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query '你的问题'"
echo ""
echo "2. 直接使用："
echo "   hermes chat --provider openrouter --model gpt-5.2 --query '你的问题'"
echo ""
echo "3. 测试连接："
echo "   hermes chat --skills ai-api-proxy-switch --query '/test-connection'"
echo ""
echo "可用模型示例："
echo "  - gpt-5.2 (复杂推理)"
echo "  - claude-sonnet-4-6 (创意写作)"
echo "  - gemini-3.1-pro-preview-thinking (深度分析)"
echo "  - gpt-5-mini (快速响应)"
echo ""
echo "查看完整模型列表："
echo "  hermes chat --skills ai-api-proxy-switch --query '/list-models'"