#!/bin/bash
# Playwright 精确控制示例

echo "=== Playwright 精确控制示例 ==="

# 示例: 自动填写表单
echo "1. 打开表单页面..."
playwright-cli open "https://example.com/form"

echo "2. 获取页面快照..."
playwright-cli snapshot

echo "3. 填写表单..."
playwright-cli fill e1 "user@example.com"  # 邮箱
playwright-cli fill e2 "password123"        # 密码
playwright-cli click e3                      # 提交按钮

echo "4. 验证结果..."
playwright-cli snapshot

echo "5. 关闭浏览器..."
playwright-cli close

echo "完成！"