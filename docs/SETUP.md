# 超级浏览器技能 - 从 0 到 1 搭建教程

> 本教程将带你从零开始搭建超级浏览器技能，并添加到 OpenClaw 中使用。

## 📋 目录

1. [前置要求](#前置要求)
2. [安装步骤](#安装步骤)
3. [配置环境变量](#配置环境变量)
4. [测试验证](#测试验证)
5. [添加到 OpenClaw](#添加到-openclaw)
6. [常见问题](#常见问题)

---

## 前置要求

### 必需

| 软件 | 版本 | 下载地址 |
|------|------|---------|
| Node.js | ≥ 18.0 | https://nodejs.org |
| Git | 最新版 | https://git-scm.com |

### 可选

| 软件 | 用途 |
|------|------|
| Python ≥ 3.8 | Web Clipper 功能 |
| GitHub CLI | 推送更新 |

---

## 安装步骤

### 方法一：自动安装（推荐）

#### Windows

```powershell
# 1. 克隆仓库
git clone https://github.com/luze1011/super-browser-skill.git
cd super-browser-skill

# 2. 运行安装脚本
.\scripts\install.ps1
```

#### macOS / Linux

```bash
# 1. 克隆仓库
git clone https://github.com/luze1011/super-browser-skill.git
cd super-browser-skill

# 2. 运行安装脚本
chmod +x scripts/install.sh
./scripts/install.sh
```

### 方法二：手动安装

```bash
# 1. 安装核心工具
npm install -g @midscene/web@1

# 2. 安装 Playwright 浏览器
npx playwright install chromium
```

---

## 配置环境变量

### 方式一：系统环境变量（推荐）

#### Windows

```powershell
# 设置环境变量
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_API_KEY", "your-api-key", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_NAME", "qwen3.5-plus", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_BASE_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_FAMILY", "qwen3.5", "User")
```

#### macOS / Linux

```bash
# 添加到 ~/.bashrc 或 ~/.zshrc
export MIDSCENE_MODEL_API_KEY="your-api-key"
export MIDSCENE_MODEL_NAME="qwen3.5-plus"
export MIDSCENE_MODEL_BASE_URL="https://dashscope.aliyuncs.com/compatible-mode/v1"
export MIDSCENE_MODEL_FAMILY="qwen3.5"
```

### 方式二：使用 .env 文件

```bash
# 复制模板
cp config/env.template .env

# 编辑 .env 文件，填写你的 API Key
```

### 方式三：使用初始化脚本

```powershell
# Windows
. .\scripts\init-env.ps1
```

### 支持的模型提供商

| 提供商 | MODEL_NAME | MODEL_BASE_URL | 获取 API Key |
|--------|-----------|----------------|-------------|
| **阿里云 Qwen** | qwen3.5-plus | dashscope.aliyuncs.com/compatible-mode/v1 | https://dashscope.console.aliyun.com |
| **Google Gemini** | gemini-3-flash | generativelanguage.googleapis.com/v1beta/openai/ | https://aistudio.google.com/apikey |
| **豆包** | doubao-seed-2-0-lite | ark.cn-beijing.volces.com/api/v3 | https://console.volcengine.com/ark |

---

## 测试验证

### 快速测试

```powershell
# Windows
.\scripts\test-browser.ps1
```

```bash
# macOS / Linux
./scripts/test-browser.sh
```

### 手动测试

```bash
# 1. 连接浏览器
npx @midscene/web@1 connect --url "https://github.com"

# 2. 执行 AI 操作
npx @midscene/web@1 act --prompt "找到 Stars 数量"

# 3. 断开连接
npx @midscene/web@1 disconnect
```

---

## 添加到 OpenClaw

### 方法一：使用 skills CLI（推荐）

```bash
# 直接从 GitHub 安装
npx skills add luze1011/super-browser-skill --yes --global
```

### 方法二：本地安装

```bash
# 1. 克隆到 OpenClaw skills 目录
cd ~/.openclaw/workspace-taizi/skills  # 或你的 workspace 目录
git clone https://github.com/luze1011/super-browser-skill.git

# 2. 重启 OpenClaw
openclaw gateway restart
```

### 方法三：复制文件

```bash
# 复制 SKILL.md 到任意 skills 目录
cp SKILL.md ~/.agents/skills/super-browser/
```

---

## 使用示例

### 场景一：自然语言控制网页

```bash
npx @midscene/web@1 connect --url "https://github.com/web-infra-dev/midscene"
npx @midscene/web@1 act --prompt "点击 Star 按钮，然后截图"
npx @midscene/web@1 disconnect
```

### 场景二：精确表单填写

```bash
playwright-cli open "https://example.com/form"
playwright-cli snapshot
playwright-cli fill e1 "email@example.com"
playwright-cli click e2
```

### 场景三：批量数据抓取

```bash
agent-browser open "https://example.com/products" && \
agent-browser snapshot -i && \
agent-browser extract @e1 --all
```

---

## 常见问题

### Q: 提示 "model name is required"

**原因**: 环境变量未配置或未生效

**解决**:
```powershell
# 检查环境变量
echo $env:MIDSCENE_MODEL_NAME

# 如果为空，重新设置
. .\scripts\init-env.ps1
```

### Q: 浏览器无法启动

**原因**: Playwright 浏览器未安装

**解决**:
```bash
npx playwright install chromium
```

### Q: API 调用失败

**原因**: API Key 无效或过期

**解决**:
1. 检查 API Key 是否正确
2. 检查账户余额
3. 确认 API 端点地址正确

### Q: 如何更新技能？

```bash
# 方法一：重新安装
npx skills add luze1011/super-browser-skill --yes --global --force

# 方法二：git pull
cd super-browser-skill
git pull
```

---

## 进阶配置

### 多模型配置

```bash
# 规划模型
MIDSCENE_PLANNING_MODEL_NAME=gpt-4
MIDSCENE_PLANNING_MODEL_API_KEY=your-openai-key

# 洞察模型
MIDSCENE_INSIGHT_MODEL_NAME=qwen-vl-plus
MIDSCENE_INSIGHT_MODEL_API_KEY=your-qwen-key
```

### CDP 模式（连接用户浏览器）

```bash
# 1. 启动 Chrome 并开启远程调试
chrome.exe --remote-debugging-port=9222

# 2. 连接到现有浏览器
npx @midscene/web@1 connect --cdp ws://127.0.0.1:9222/devtools/browser
```

---

## 相关链接

- [Midscene 官方文档](https://midscenejs.com)
- [Playwright 文档](https://playwright.dev)
- [OpenClaw 文档](https://docs.openclaw.ai)
- [问题反馈](https://github.com/luze1011/super-browser-skill/issues)

---

_Created by 太子 (OpenClaw Agent)_