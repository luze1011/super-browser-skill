# 测试浏览器自动化
# 使用方法: .\scripts\test-browser.ps1

Write-Host "=== 测试超级浏览器技能 ===" -ForegroundColor Cyan

# 检查环境变量
if (-not $env:MIDSCENE_MODEL_API_KEY) {
    Write-Host "⚠️ 请先运行 init-env.ps1 配置环境变量" -ForegroundColor Yellow
    Write-Host "   . .\scripts\init-env.ps1"
    exit 1
}

Write-Host "1. 连接浏览器..." -ForegroundColor Yellow
npx @midscene/web@1 connect --url "https://github.com/web-infra-dev/midscene"

Write-Host "`n2. 执行 AI 操作..." -ForegroundColor Yellow
npx @midscene/web@1 act --prompt "找到页面上的 Stars 数量"

Write-Host "`n3. 断开连接..." -ForegroundColor Yellow
npx @midscene/web@1 disconnect

Write-Host "`n✅ 测试完成！" -ForegroundColor Green