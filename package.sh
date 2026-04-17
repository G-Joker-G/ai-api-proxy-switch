#!/bin/bash
# AI API Proxy Switch Skill 打包脚本
# 用法: ./package.sh [版本号]

set -e

VERSION=${1:-"1.0.0"}
PACKAGE_NAME="ai-api-proxy-switch-v${VERSION}"
OUTPUT_DIR="/tmp/${PACKAGE_NAME}"

echo "=== AI API Proxy Switch Skill 打包程序 ==="
echo "版本: ${VERSION}"
echo ""

# 清理并创建输出目录
echo "📁 创建输出目录: ${OUTPUT_DIR}"
rm -rf "${OUTPUT_DIR}"
mkdir -p "${OUTPUT_DIR}"

# 复制所有必要文件
echo "📋 复制文件..."
cp -r ./* "${OUTPUT_DIR}/" 2>/dev/null || true
cp .gitignore "${OUTPUT_DIR}/" 2>/dev/null || true

# 移除不需要的文件
echo "🧹 清理不需要的文件..."
cd "${OUTPUT_DIR}"
rm -f package.sh 2>/dev/null || true

# 创建版本文件
echo "📝 创建版本文件..."
cat > VERSION << EOF
AI API Proxy Switch Skill
Version: ${VERSION}
Build Date: $(date +"%Y-%m-%d %H:%M:%S")
GitHub: https://github.com/G-Joker-G/ai-api-proxy-switch
EOF

# 设置文件权限
echo "🔧 设置文件权限..."
chmod +x install.sh troubleshoot.sh references/quick-setup.sh examples/usage-examples.sh

# 创建压缩包
echo "📦 创建压缩包..."
cd /tmp
tar -czf "${PACKAGE_NAME}.tar.gz" "${PACKAGE_NAME}"

# 显示结果
echo ""
echo "✅ 打包完成!"
echo ""
echo "生成的包:"
echo "  - /tmp/${PACKAGE_NAME}.tar.gz"
echo ""
echo "目录结构:"
echo "  - /tmp/${PACKAGE_NAME}/ (完整源码)"
echo ""
echo "文件列表:"
find "/tmp/${PACKAGE_NAME}" -type f | sort
echo ""
echo "包大小:"
ls -lh "/tmp/${PACKAGE_NAME}.tar.gz"
echo ""
echo "发布说明:"
echo "1. 将压缩包上传到 GitHub Releases"
echo "2. 或者将源码目录推送到 GitHub 仓库"
echo "3. 更新 README.md 中的版本信息"
echo ""
echo "GitHub 仓库: https://github.com/G-Joker-G/ai-api-proxy-switch"