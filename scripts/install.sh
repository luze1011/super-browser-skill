#!/bin/bash
# Super Browser Skill 安装脚本
# 适用于 macOS / Linux

set -e

echo "🌐 安装超级浏览器技能..."

# 检查 Node.js
if ! command -v node &> /dev/null; then
    echo "❌ 请先安装 Node.js: https://nodejs.org"
    exit 1
fi

echo "✅ Node.js: $(node --version)"

# 安装依赖
echo "📦 安装依赖..."
npm install -g @midscene/web@1 playwright-cli agent-browser 2>/dev/null || true

# 安装 Playwright 浏览器
echo "🌐 安装 Playwright 浏览器..."
npx playwright install chromium 2>/dev/null || true

echo ""
echo "✅ 安装完成！"
echo ""
echo "📝 下一步："
echo "   1. 配置环境变量（见 docs/SETUP.md）"
echo "   2. 运行测试（见 examples/quick-test.sh）"