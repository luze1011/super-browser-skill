#!/bin/bash
# AI 视觉控制示例

# 设置环境变量（如果未配置）
export MIDSCENE_MODEL_API_KEY="${MIDSCENE_MODEL_API_KEY:-your-api-key}"
export MIDSCENE_MODEL_NAME="${MIDSCENE_MODEL_NAME:-qwen3.5-plus}"
export MIDSCENE_MODEL_BASE_URL="${MIDSCENE_MODEL_BASE_URL:-https://dashscope.aliyuncs.com/compatible-mode/v1}"
export MIDSCENE_MODEL_FAMILY="${MIDSCENE_MODEL_FAMILY:-qwen3.5}"

echo "=== AI 视觉控制示例 ==="

# 示例 1: 搜索 GitHub
echo "1. 搜索 GitHub..."
npx @midscene/web@1 connect --url "https://github.com"
npx @midscene/web@1 act --prompt "在搜索框输入 OpenClaw，点击搜索按钮"
npx @midscene/web@1 take_screenshot
npx @midscene/web@1 disconnect

echo "完成！"