# AI API Proxy 配置指南

## 环境变量配置

### 必需的环境变量
```bash
# 设置 API Key（从 api.clawsocket.com 获取）
export OPENROUTER_API_KEY='你的_clawsocket_api_key'

# 设置 API 端点
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
```

### 可选：添加到 shell 配置文件
```bash
# 添加到 ~/.bashrc 或 ~/.zshrc（可选）
echo 'export OPENROUTER_API_KEY="你的_clawsocket_api_key"' >> ~/.bashrc
echo 'export OPENROUTER_BASE_URL="https://api.clawsocket.com/v1"' >> ~/.bashrc
source ~/.bashrc
```

## 使用方法

### 方法1：使用技能（推荐）
```bash
# 使用 gpt-5.2 模型
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "你的问题"

# 使用 claude-sonnet-4-6 模型
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "你的问题"
```

### 方法2：直接使用
```bash
# 配置环境变量后直接使用
hermes chat --provider openrouter --model gpt-5.2 --query "你的问题"
```

## 可用模型

主要模型列表：
- gpt-5.2 (复杂推理)
- claude-sonnet-4-6 (创意写作)
- claude-opus-4-6 (最强推理)
- gemini-3.1-pro-preview-thinking (深度分析)
- gpt-5-mini (快速响应)
- gpt-5.3-codex (代码生成)

## 故障排除

### 常见错误
1. "Provider resolver returned an empty API key"
   - 解决：确保设置了 OPENROUTER_API_KEY 环境变量

2. 模型不可用
   - 解决：检查模型名称是否正确

3. API 调用失败
   - 解决：检查 API Key 是否有效

## 测试命令

```bash
# 测试连接
hermes chat --skills ai-api-proxy-switch --query "/test-connection"

# 查看模型列表
hermes chat --skills ai-api-proxy-switch --query "/list-models"
```

## 注意事项
- 确保 API Key 有效
- 根据任务选择合适的模型
- 大模型响应时间较长
- 遵守服务条款