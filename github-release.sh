#!/bin/bash
# GitHub发布脚本
# 用法: ./github-release.sh [版本号]

set -e

VERSION=${1:-"1.0.0"}
REPO_NAME="ai-api-proxy-switch"
REPO_URL="https://github.com/G-Joker-G/${REPO_NAME}.git"
SKILL_DIR="/home/feng/.hermes/skills/software-development/${REPO_NAME}"

echo "=== GitHub发布脚本 ==="
echo "版本: ${VERSION}"
echo "仓库: ${REPO_URL}"
echo "技能目录: ${SKILL_DIR}"
echo ""

# 检查是否在技能目录
if [ ! -f "${SKILL_DIR}/SKILL.md" ]; then
    echo "❌ 错误: 不在技能目录中"
    echo "请进入: ${SKILL_DIR}"
    exit 1
fi

cd "${SKILL_DIR}"

# 检查Git是否安装
if ! command -v git &> /dev/null; then
    echo "❌ 错误: Git未安装"
    echo "请安装: sudo apt-get install git"
    exit 1
fi

# 初始化Git仓库（如果尚未初始化）
if [ ! -d ".git" ]; then
    echo "📁 初始化Git仓库..."
    git init
fi

# 添加所有文件
echo "📋 添加文件到Git..."
git add .

# 检查是否有更改
if git diff --cached --quiet; then
    echo "⚠️  没有更改需要提交"
else
    # 提交更改
    echo "💾 提交更改..."
    git commit -m "Release v${VERSION}

Changelog:
- Initial release of AI API Proxy Switch Skill
- Complete documentation in English and Chinese
- Installation and troubleshooting scripts
- Support for multiple AI models
- Dynamic model switching without config modification"
fi

# 检查远程仓库
if ! git remote | grep -q origin; then
    echo "🔗 添加远程仓库..."
    git remote add origin "${REPO_URL}"
else
    echo "✅ 远程仓库已配置"
fi

# 推送到GitHub
echo "🚀 推送到GitHub..."
echo ""
echo "注意: 如果这是第一次推送，可能需要:"
echo "1. 在GitHub创建仓库: ${REPO_URL}"
echo "2. 设置分支名称"
echo ""
echo "推荐的分支设置:"
echo "  git branch -M main"
echo "  git push -u origin main"
echo ""
echo "或者如果使用master分支:"
echo "  git push -u origin master"
echo ""
echo "请手动执行推送命令，因为需要确认仓库已创建。"

# 显示Git状态
echo "📊 Git状态:"
git status
echo ""
echo "远程仓库:"
git remote -v
echo ""
echo "分支信息:"
git branch -a
echo ""
echo "📝 手动执行步骤:"
echo "1. 创建GitHub仓库: ${REPO_URL}"
echo "2. 设置分支名称:"
echo "   git branch -M main  # 重命名为main分支"
echo "3. 推送到GitHub:"
echo "   git push -u origin main"
echo ""
echo "或者使用master分支:"
echo "   git push -u origin master"
echo ""
echo "🎉 发布完成后，可以:"
echo "1. 在GitHub仓库设置主题标签"
echo "2. 创建Release v${VERSION}"
echo "3. 上传打包文件: /tmp/${REPO_NAME}-v${VERSION}.tar.gz"