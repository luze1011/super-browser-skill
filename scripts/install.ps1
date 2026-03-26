# Super Browser Skill 安装脚本
# 适用于 Windows

Write-Host "🌐 安装超级浏览器技能..." -ForegroundColor Cyan

# 检查 Node.js
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "❌ 请先安装 Node.js: https://nodejs.org" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Node.js: $(node --version)" -ForegroundColor Green

# 安装依赖
Write-Host "📦 安装依赖..." -ForegroundColor Yellow
npm install -g @midscene/web@1 2>$null
npm install -g playwright 2>$null

# 安装 Playwright 浏览器
Write-Host "🌐 安装 Playwright 浏览器..." -ForegroundColor Yellow
npx playwright install chromium 2>$null

Write-Host ""
Write-Host "✅ 安装完成！" -ForegroundColor Green
Write-Host ""
Write-Host "📝 下一步：" -ForegroundColor Cyan
Write-Host "   1. 配置环境变量（见 docs/SETUP.md）"
Write-Host "   2. 运行测试：.\scripts\test-browser.ps1"