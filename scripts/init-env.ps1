# 环境变量配置脚本
# 使用方法: . .\scripts\init-env.ps1

Write-Host "=== 配置 Midscene 环境变量 ===" -ForegroundColor Cyan

# Midscene 配置
$env:MIDSCENE_MODEL_API_KEY = "your-api-key"  # 替换为你的 API Key
$env:MIDSCENE_MODEL_BASE_URL = "https://dashscope.aliyuncs.com/compatible-mode/v1"  # Qwen
$env:MIDSCENE_MODEL_NAME = "qwen3.5-plus"
$env:MIDSCENE_MODEL_FAMILY = "qwen3.5"
$env:MIDSCENE_MODEL_REASONING_ENABLED = "false"

Write-Host "✅ 环境变量已设置" -ForegroundColor Green
Write-Host "   MODEL: $env:MIDSCENE_MODEL_NAME" -ForegroundColor Gray
Write-Host "   FAMILY: $env:MIDSCENE_MODEL_FAMILY" -ForegroundColor Gray

# 永久保存到用户环境变量
Write-Host ""
Write-Host "是否保存到用户环境变量？(y/n)" -ForegroundColor Yellow
$save = Read-Host
if ($save -eq "y") {
    [Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_API_KEY", $env:MIDSCENE_MODEL_API_KEY, "User")
    [Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_BASE_URL", $env:MIDSCENE_MODEL_BASE_URL, "User")
    [Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_NAME", $env:MIDSCENE_MODEL_NAME, "User")
    [Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_FAMILY", $env:MIDSCENE_MODEL_FAMILY, "User")
    [Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_REASONING_ENABLED", $env:MIDSCENE_MODEL_REASONING_ENABLED, "User")
    Write-Host "✅ 已保存到用户环境变量" -ForegroundColor Green
}