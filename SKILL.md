---
name: ai-api-proxy-switch
description: 动态切换 AI API Proxy 模型，无需修改 Hermes 核心配置
category: software-development
trigger:
  - 当用户需要更强的推理能力时
  - 当用户指定使用 gpt-5.2、claude-sonnet 等高级模型时
  - 当 deepseek 无法满足复杂任务需求时
  - 用户明确要求使用 AI API Proxy 时
---

# AI API Proxy Switch Skill

## 概述

本技能允许 Hermes Agent 动态切换到 AI API Proxy 提供的各种高级模型（如 gpt-5.2、claude-sonnet-4-6、gpt-5.3-codex 等），而无需修改 Hermes 的核心配置文件。

**特别适合中国用户**：基础LLM使用DeepSeek（国内可用），需要时通过AI API Proxy访问国外高级模型。

## 工作原理

使用 OpenRouter provider 作为适配器，通过环境变量覆盖实现动态切换。智能路由逻辑：
- 默认使用DeepSeek（国内用户友好）
- 指定高级模型时自动通过AI API Proxy访问
- 解决国内用户访问国外LLM的网络限制问题

## 前提条件

1. **AI API Proxy 账户**：在 api.clawsocket.com 注册并获取 API Key
2. **环境变量设置**：
   ```bash
   export OPENROUTER_API_KEY="你的_clawsocket_api_key"
   ```

## 基本使用方法

### 使用 gpt-5.2 模型
```bash
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "你的问题"
```

### 使用 claude-sonnet-4-6 模型  
```bash
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "你的问题"
```

### 使用 gpt-5.3-codex 模型（代码开发优化）
```bash
hermes chat --skills ai-api-proxy-switch --model gpt-5.3-codex --query "你的代码问题"
```

### 使用 gpt-5-mini 模型（轻量级推理）
```bash
hermes chat --skills ai-api-proxy-switch --model gpt-5-mini --query "你的问题"
```

### 使用 gemini-3-flash-preview 模型（快速响应）
```bash
hermes chat --skills ai-api-proxy-switch --model gemini-3-flash-preview --query "你的问题"
```

## 环境变量配置方法

### 临时配置（推荐用于测试）
```bash
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
export OPENROUTER_API_KEY='你的_clawsocket_api_key'
```

### 直接使用（无需技能）
配置环境变量后，可以直接使用：
```bash
hermes chat --provider openrouter --model gpt-5.2 --query "你的问题"
```

## 可用模型

通过 AI API Proxy 可用的主要模型：

1. **gpt-5.2** - 推荐用于复杂推理
2. **claude-sonnet-4-6** - 平衡性能，创意优秀
3. **claude-opus-4-6** - 最强推理能力
4. **gemini-3.1-pro-preview-thinking** - Google 深度思考模型
5. **gpt-5-mini** - 轻量快速模型
6. **gpt-5.3-codex** - 代码专用模型

## 模型推荐

| 任务类型 | 推荐模型 | 说明 |
|---------|---------|------|
| 复杂逻辑推理 | gpt-5.2 | 最强推理能力 |
| 创意写作 | claude-sonnet-4-6 | 创意表达优秀 |
| 代码生成 | gpt-5.3-codex | 代码专用优化 |
| 快速响应 | gpt-5-mini | 响应速度快 |
| 深度分析 | gemini-3.1-pro-preview-thinking | 深度思考模式 |

## 故障排除

### 常见问题

1. **错误：Provider resolver returned an empty API key**
   - 解决：设置 `export OPENROUTER_API_KEY='你的_api_key'`

2. **错误：模型不可用**
   - 解决：检查模型名称是否正确

4. **状态栏显示问题**
   - 现象：状态栏显示"deepseek-chat"而不是当前模型
   - 原因：Hermes界面缓存默认配置
   - 验证：界面中央显示"模型名称 · Nous Research"即为成功
   - 解决：实际调用已成功，显示问题可忽略

## 注意事项

1. 确保 API Key 有效且有足够配额
2. 根据任务复杂度选择合适的模型
3. 大模型（如 gpt-5.2）响应时间较长
4. 遵守 AI API Proxy 服务条款

## 技能命令

技能内支持以下命令：

- `/list-models` - 查看可用模型列表
- `/test-connection` - 测试 API 连接
- `/show-config` - 显示当前配置

## 示例

```bash
# 使用 gpt-5.2 进行复杂推理
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "如果3个人3天能完成一项工作，那么6个人需要多少天？请分步骤推理。"

# 使用 claude-sonnet 进行创意写作
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "写一首关于人工智能的诗"
```

---

**提示**：本技能仅提供模型切换功能，实际 API 调用由 AI API Proxy 服务处理。