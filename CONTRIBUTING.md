# 贡献指南

感谢您考虑为 AI API Proxy Switch Skill 做出贡献！本指南将帮助您了解如何参与项目开发。

## 行为准则

请遵守以下行为准则：
- 尊重所有贡献者
- 建设性的沟通
- 包容和友好的环境

## 如何贡献

### 报告问题

1. 在提交 Issue 前，请先搜索是否已有类似问题
2. 使用 Issue 模板提供详细信息：
   - 问题描述
   - 复现步骤
   - 期望行为
   - 实际行为
   - 环境信息（Hermes 版本、操作系统等）
   - 错误日志（如果有）

### 提交功能请求

1. 描述您想要的功能
2. 解释为什么这个功能有用
3. 提供使用场景示例
4. 如果可能，描述实现思路

### 提交代码

#### 开发流程

1. **Fork 仓库**
   ```bash
   # Fork 项目到您的 GitHub 账户
   ```

2. **克隆仓库**
   ```bash
   git clone https://github.com/your-username/ai-api-proxy-switch.git
   cd ai-api-proxy-switch
   ```

3. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   # 或
   git checkout -b fix/issue-description
   ```

4. **进行更改**
   - 编写代码
   - 添加测试
   - 更新文档

5. **提交更改**
   ```bash
   git add .
   git commit -m "描述您的更改"
   ```

6. **推送到分支**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **创建 Pull Request**
   - 在 GitHub 上创建 Pull Request
   - 描述您的更改
   - 链接相关 Issue

#### 代码规范

1. **Shell 脚本**
   - 使用 `#!/bin/bash`
   - 添加适当的错误处理 (`set -e`)
   - 添加注释说明复杂逻辑
   - 遵循 ShellCheck 建议

2. **文档**
   - 使用 Markdown 格式
   - 保持一致的标题层级
   - 添加代码示例
   - 更新相关文档

3. **提交信息**
   - 使用英文或中文
   - 格式：`类型: 描述`
   - 类型：`feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

#### 测试要求

1. **手动测试**
   ```bash
   # 测试安装脚本
   ./install.sh
   
   # 测试故障排除工具
   ./troubleshoot.sh
   
   # 测试使用示例
   ./examples/usage-examples.sh
   ```

2. **验证功能**
   - 确保技能能正确加载
   - 测试不同模型的切换
   - 验证错误处理

## 项目结构

```
ai-api-proxy-switch/
├── README.md                 # 英文主文档
├── README_zh-CN.md          # 中文文档
├── SKILL.md                 # 技能元数据
├── LICENSE                  # 许可证
├── install.sh              # 安装脚本
├── troubleshoot.sh         # 故障排除工具
├── docs/                   # 详细文档
│   └── DETAILED_GUIDE.md
├── examples/               # 使用示例
│   ├── config.env.example
│   └── usage-examples.sh
├── references/            # 参考文件
│   ├── config-guide.md
│   └── quick-setup.sh
└── scripts/              # 脚本目录（预留）
```

## 开发环境设置

### 本地测试

1. **安装 Hermes Agent**
   ```bash
   # 按照 Hermes 官方文档安装
   ```

2. **设置开发环境**
   ```bash
   # 克隆仓库
   git clone https://github.com/your-username/ai-api-proxy-switch.git
   cd ai-api-proxy-switch
   
   # 创建符号链接到技能目录
   ln -sf "$(pwd)" ~/.hermes/skills/software-development/ai-api-proxy-switch
   ```

3. **配置测试环境**
   ```bash
   # 设置测试用的 API Key（可以使用无效的进行测试）
   export OPENROUTER_API_KEY='test_key'
   export OPENROUTER_BASE_URL='https://api.clawsocket.com/v1'
   ```

### 测试流程

1. **运行所有测试**
   ```bash
   ./troubleshoot.sh
   ```

2. **验证文档**
   ```bash
   # 检查 Markdown 格式
   # 可以使用 markdownlint 等工具
   ```

3. **验证脚本**
   ```bash
   # 检查 Shell 脚本语法
   shellcheck install.sh troubleshoot.sh examples/*.sh
   ```

## 发布流程

### 版本管理

使用语义化版本控制：
- `MAJOR`：不兼容的 API 修改
- `MINOR`：向下兼容的功能性新增
- `PATCH`：向下兼容的问题修正

### 发布检查清单

- [ ] 更新版本号
- [ ] 更新 CHANGELOG.md
- [ ] 更新文档
- [ ] 运行所有测试
- [ ] 验证安装脚本
- [ ] 创建 Git tag
- [ ] 发布到 GitHub

## 获取帮助

- **文档**：查看 `docs/` 目录
- **问题**：在 GitHub Issues 中提问
- **讨论**：使用 GitHub Discussions
- **即时通讯**：查看项目主页获取联系信息

## 致谢

感谢所有贡献者的时间和努力！您的贡献使这个项目变得更好。

---

**注意**：在贡献代码前，请确保您理解并同意项目的 MIT 许可证。