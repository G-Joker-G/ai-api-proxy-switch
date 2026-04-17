# AI API Proxy Switch Skill

[English](README.md) | 简体中文

## 概述

AI API Proxy Switch Skill 是一个 Hermes Agent 技能，允许用户动态切换到 AI API Proxy 提供的各种高级 AI 模型，而无需修改 Hermes Agent 的核心配置文件。

### 主要特性

- **动态模型切换**：无需修改配置文件即可在不同 AI 模型间切换
- **多提供商支持**：支持 OpenAI、Anthropic、Google 等主流 AI 提供商
- **统一接口**：为不同模型提供统一的调用接口
- **成本监控**：通过 Clawsocket 控制台实时监控 token 消耗
- **简化配置**：通过环境变量轻松配置

## 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/G-Joker-G/ai-api-proxy-switch.git

# 复制到技能目录
cp -r ai-api-proxy-switch ~/.hermes/skills/software-development/
```

### 配置

1. 在 [api.clawsocket.com](https://api.clawsocket.com) 注册并获取 API Key
2. 设置环境变量：

```bash
# 临时设置
export OPENROUTER_API_KEY='你的_cla..._key'
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'

# 或永久设置（添加到 ~/.bashrc 或 ~/.zshrc）
echo 'export OPENROUTER_API_KEY="你的_cla..._key"' >> ~/.bashrc
echo 'export OPENROUTER_BASE_URL="https://api.clawsocket.com/v1"' >> ~/.bashrc
source ~/.bashrc
```

### 基本使用

```bash
# 使用 GPT-5.2 进行复杂推理
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "你的问题"

# 使用 Claude-Sonnet 进行创意写作
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "写一首诗"

# 测试连接
hermes chat --skills ai-api-proxy-switch --query "/test-connection"
```

## 支持的模型

### OpenAI 系列
- `gpt-5.2` - 最新 GPT-5 模型，最强推理能力
- `gpt-5-mini` - 轻量级 GPT-5 模型，快速响应
- `gpt-5.3-codex` - 代码专用优化模型

### Anthropic 系列
- `claude-opus-4-6` - Claude Opus 最新版本
- `claude-sonnet-4-6` - Claude Sonnet 最新版本
- `claude-haiku-4-6` - Claude Haiku 最新版本

### Google 系列
- `gemini-3.1-pro-preview-thinking` - Gemini 深度思考模式
- `gemini-3.1-pro-preview` - Gemini 标准版本

## 故障排除

### 常见问题

1. **错误：Provider resolver returned an empty API key**
   - 解决：确保设置了 `OPENROUTER_API_KEY` 环境变量

2. **错误：模型不可用**
   - 解决：检查模型名称是否正确，运行 `/list-models` 查看可用模型

3. **API 调用失败**
   - 解决：检查 API Key 是否有效，网络连接是否正常

### 诊断命令

```bash
# 检查环境变量
echo $OPENROUTER_API_KEY

# 测试 API 连接
curl -X GET "https://api.clawsocket.com/v1/models" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

## 最佳实践

### 模型选择指南

| 任务类型 | 推荐模型 | 说明 |
|----------|----------|------|
| 复杂推理 | `gpt-5.2` | 最强的推理和分析能力 |
| 创意写作 | `claude-sonnet-4-6` | 优秀的创意表达 |
| 代码生成 | `gpt-5.3-codex` | 代码专用优化 |
| 快速响应 | `gpt-5-mini` | 响应速度快，成本低 |
| 深度分析 | `gemini-3.1-pro-preview-thinking` | 深度思考模式 |

### 成本优化

1. 简单任务使用轻量级模型
2. 定期监控 token 消耗
3. 批量处理相关任务

## 高级功能

### 技能内置命令

- `/list-models` - 查看可用模型列表
- `/test-connection` - 测试 API 连接
- `/show-config` - 显示当前配置

### 批量处理

```bash
for model in "gpt-5.2" "claude-sonnet-4-6"; do
    echo "=== 使用 $model ==="
    hermes chat --skills ai-api-proxy-switch --model $model --query "问题"
done
```

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

MIT License