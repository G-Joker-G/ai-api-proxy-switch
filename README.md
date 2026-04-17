# AI API Proxy Switch Skill

English | [简体中文](README_zh-CN.md)

## Overview

AI API Proxy Switch Skill is a Hermes Agent skill that allows users to dynamically switch between various advanced AI models provided by AI API Proxy, without modifying Hermes Agent's core configuration files.

### Key Features

- **Dynamic Model Switching**: Switch between different AI models without modifying configuration files
- **Multi-Provider Support**: Support for major AI providers like OpenAI, Anthropic, Google
- **Unified Interface**: Consistent calling interface for different models
- **Cost Monitoring**: Real-time token consumption monitoring via Clawsocket dashboard
- **Easy Configuration**: Simple setup through environment variables

## Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/G-Joker-G/ai-api-proxy-switch.git

# Copy to skills directory
cp -r ai-api-proxy-switch ~/.hermes/skills/software-development/
```

### Configuration

1. Register at [api.clawsocket.com](https://api.clawsocket.com) and get your API Key
2. Set environment variables:

```bash
# Temporary setup
export OPENROUTER_API_KEY='your_cla..._key'
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'

# Or permanent setup (add to ~/.bashrc or ~/.zshrc)
echo 'export OPENROUTER_API_KEY="your_cla..._key"' >> ~/.bashrc
echo 'export OPENROUTER_BASE_URL="https://api.clawsocket.com/v1"' >> ~/.bashrc
source ~/.bashrc
```

### Basic Usage

```bash
# Use GPT-5.2 for complex reasoning
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "Your question"

# Use Claude-Sonnet for creative writing
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "Write a poem"

# Test connection
hermes chat --skills ai-api-proxy-switch --query "/test-connection"
```

## Supported Models

### OpenAI Series
- `gpt-5.2` - Latest GPT-5 model, strongest reasoning capability
- `gpt-5-mini` - Lightweight GPT-5 model, fast response
- `gpt-5.3-codex` - Code-optimized model

### Anthropic Series
- `claude-opus-4-6` - Latest Claude Opus version
- `claude-sonnet-4-6` - Latest Claude Sonnet version
- `claude-haiku-4-6` - Latest Claude Haiku version

### Google Series
- `gemini-3.1-pro-preview-thinking` - Gemini deep thinking mode
- `gemini-3.1-pro-preview` - Gemini standard version

## Troubleshooting

### Common Issues

1. **Error: Provider resolver returned an empty API key**
   - Solution: Ensure `OPENROUTER_API_KEY` environment variable is set

2. **Error: Model not available**
   - Solution: Check model name, run `/list-models` to see available models

3. **API call failed**
   - Solution: Check if API Key is valid, network connection is working

### Diagnostic Commands

```bash
# Check environment variables
echo $OPENROUTER_API_KEY

# Test API connection
curl -X GET "https://api.clawsocket.com/v1/models" \
  -H "Authorization: Bearer $OPENROUTER_API_KEY"
```

## Best Practices

### Model Selection Guide

| Task Type | Recommended Model | Description |
|-----------|------------------|-------------|
| Complex Reasoning | `gpt-5.2` | Strongest reasoning and analysis |
| Creative Writing | `claude-sonnet-4-6` | Excellent creative expression |
| Code Generation | `gpt-5.3-codex` | Code-optimized |
| Fast Response | `gpt-5-mini` | Fast response, low cost |
| Deep Analysis | `gemini-3.1-pro-preview-thinking` | Deep thinking mode |

### Cost Optimization

1. Use lightweight models for simple tasks
2. Regularly monitor token consumption
3. Batch process related tasks

## Advanced Features

### Built-in Commands

- `/list-models` - View available model list
- `/test-connection` - Test API connection
- `/show-config` - Show current configuration

### Batch Processing

```bash
for model in "gpt-5.2" "claude-sonnet-4-6"; do
    echo "=== Using $model ==="
    hermes chat --skills ai-api-proxy-switch --model $model --query "Question"
done
```

## Contributing

Issues and Pull Requests are welcome!

## License

MIT License