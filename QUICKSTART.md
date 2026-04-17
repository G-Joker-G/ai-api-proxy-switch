# Quick Start Guide

## 🚀 5-Minute Quick Start

### Step 1: Get Your API Key
1. Visit [api.clawsocket.com](https://api.clawsocket.com)
2. Register for a free account
3. Copy your API Key from the dashboard

### Step 2: Install the Skill
```bash
# Method 1: Using install script (recommended)
curl -sSL https://raw.githubusercontent.com/G-Joker-G/ai-api-proxy-switch/main/install.sh | bash

# Method 2: Manual installation
git clone https://github.com/G-Joker-G/ai-api-proxy-switch.git
cp -r ai-api-proxy-switch ~/.hermes/skills/software-development/
```

### Step 3: Configure Environment Variables
```bash
# Replace 'your-api-key-here' with your actual API Key
export OPENROUTER_API_KEY='your-api-key-here'
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'

# For permanent setup (optional)
echo 'export OPENROUTER_API_KEY="your-api-key-here"' >> ~/.bashrc
echo 'export OPENROUTER_BASE_URL="https://api.clawsocket.com/v1"' >> ~/.bashrc
source ~/.bashrc
```

### Step 4: Test Your Setup
```bash
# Test with a simple query
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "Hello, test connection!"

# Check token consumption at api.clawsocket.com dashboard
```

## 📋 Quick Command Reference

### Basic Commands
```bash
# Use GPT-5.2 for complex reasoning
hermes chat --skills ai-api-proxy-switch --model gpt-5.2 --query "Your question"

# Use Claude Sonnet for creative tasks
hermes chat --skills ai-api-proxy-switch --model claude-sonnet-4-6 --query "Write a poem"

# Use Gemini for analysis
hermes chat --skills ai-api-proxy-switch --model gemini-3.1-pro-preview-thinking --query "Analyze this data"
```

### Skill Commands
```bash
# List available models
hermes chat --skills ai-api-proxy-switch --query "/list-models"

# Test API connection
hermes chat --skills ai-api-proxy-switch --query "/test-connection"

# Show current configuration
hermes chat --skills ai-api-proxy-switch --query "/show-config"
```

## 🎯 Model Selection Guide

| Task Type | Recommended Model | Response Time | Best For |
|-----------|------------------|---------------|----------|
| Complex Reasoning | gpt-5.2 | ~5-10s | Logic puzzles, math problems |
| Creative Writing | claude-sonnet-4-6 | ~3-8s | Stories, poems, creative content |
| Code Generation | gpt-5.3-codex | ~2-6s | Programming, debugging |
| Quick Responses | gpt-5-mini | ~1-3s | Simple questions, quick tasks |
| Deep Analysis | gemini-3.1-pro-preview-thinking | ~8-15s | Research, analysis, planning |

## 🔧 Quick Troubleshooting

### Common Issues & Solutions

**Issue 1: "Provider resolver returned an empty API key"**
```bash
# Solution: Set environment variables
export OPENROUTER_API_KEY='your-api-key'
export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
```

**Issue 2: Model not available**
```bash
# Solution: Check model name spelling
hermes chat --skills ai-api-proxy-switch --query "/list-models"
```

**Issue 3: Slow response**
```bash
# Solution: Try a faster model
hermes chat --skills ai-api-proxy-switch --model gpt-5-mini --query "Your question"
```

**Issue 4: No token consumption in dashboard**
```bash
# Solution: Verify API Key is correct
echo $OPENROUTER_API_KEY
```

## 💡 Quick Tips

1. **Start with gpt-5-mini** for testing to save tokens
2. **Monitor usage** at api.clawsocket.com dashboard
3. **Use batch processing** for multiple queries
4. **Experiment with different models** for different tasks
5. **Check logs** for detailed error information

## 📞 Need Help?

- **Documentation**: See [README.md](README.md) for detailed guide
- **Examples**: Check [examples/](examples/) directory
- **Issues**: Open an issue on GitHub
- **Community**: Join discussions in the repository

---

**Next Steps**: After quick setup, check out the [Detailed Guide](docs/DETAILED_GUIDE.md) for advanced features and configuration options.