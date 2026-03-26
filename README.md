# 🌐 Super Browser Skill

> **统一浏览器自动化平台 — 一站式解决所有网页交互需求**

融合五大浏览器自动化能力，让 AI 像 human 一样操作浏览器。

---

## ✨ 功能特点

| 能力 | 工具 | 特点 |
|------|------|------|
| 🤖 **AI 视觉控制** | Midscene | 自然语言操作，AI 自动规划执行 |
| 🎯 **精确自动化** | Playwright | 元素定位，表单填写，网络拦截 |
| 🔧 **调试分析** | DevTools | 性能分析，网络抓包，控制台调试 |
| ✂️ **内容提取** | Web Clipper | 网页剪藏，数据抓取，Markdown 转换 |
| ⚡ **快速操作** | agent-browser | CLI 命令，批量处理，自动化脚本 |

---

## 📦 安装

### 方式一：使用 skills CLI（推荐）

```bash
npx skills add luze1011/super-browser-skill --yes --global
```

### 方式二：手动安装

```bash
# 克隆仓库
git clone https://github.com/luze1011/super-browser-skill.git
cd super-browser-skill

# 运行安装脚本
.\scripts\install.ps1  # Windows
# 或
./scripts/install.sh   # macOS/Linux
```

---

## 🚀 快速开始

### 1. 配置环境变量

```powershell
# Windows
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_API_KEY", "your-api-key", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_NAME", "qwen3.5-plus", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_BASE_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1", "User")
[Environment]::SetEnvironmentVariable("MIDSCENE_MODEL_FAMILY", "qwen3.5", "User")
```

### 2. 测试

```bash
npx @midscene/web@1 connect --url "https://github.com"
npx @midscene/web@1 act --prompt "找到 Stars 数量"
npx @midscene/web@1 disconnect
```

---

## 📚 使用示例

### AI 视觉控制（推荐）

```bash
# 自然语言操作网页
npx @midscene/web@1 connect --url "https://github.com/web-infra-dev/midscene"
npx @midscene/web@1 act --prompt "点击 Star 按钮，然后截图"
npx @midscene/web@1 disconnect
```

### 精确自动化

```bash
# 表单填写
playwright-cli open "https://example.com/form"
playwright-cli snapshot
playwright-cli fill e1 "email@example.com"
playwright-cli click e2
```

### 快速 CLI

```bash
# 链式命令
agent-browser open "https://github.com" && agent-browser screenshot
```

---

## 📖 文档

| 文档 | 说明 |
|------|------|
| [SETUP.md](./docs/SETUP.md) | 从 0 到 1 搭建教程 |
| [SKILL.md](./SKILL.md) | 完整技能文档 |
| [examples/](./examples/) | 使用示例 |

---

## 🗂️ 目录结构

```
super-browser-skill/
├── SKILL.md              # 完整技能文档
├── README.md             # 本文件
├── docs/
│   └── SETUP.md          # 从0到1搭建教程
├── scripts/
│   ├── install.ps1       # Windows 安装脚本
│   ├── install.sh        # macOS/Linux 安装脚本
│   ├── init-env.ps1      # 环境变量配置脚本
│   └── test-browser.ps1  # 测试脚本
├── examples/
│   ├── ai-vision-example.sh    # AI 视觉控制示例
│   └── playwright-example.sh   # Playwright 示例
└── config/
    └── env.template      # 环境变量模板
```

---

## ⚙️ 支持的模型

| 提供商 | 模型 | 获取 API Key |
|--------|------|-------------|
| 阿里云 | Qwen3.5 Plus | [DashScope](https://dashscope.console.aliyun.com) |
| Google | Gemini-3-Flash | [AI Studio](https://aistudio.google.com/apikey) |
| 豆包 | Doubao Seed 2.0 | [火山引擎](https://console.volcengine.com/ark) |

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

```bash
# Fork 后克隆
git clone https://github.com/your-username/super-browser-skill.git

# 创建分支
git checkout -b feature/your-feature

# 提交
git commit -m "Add your feature"
git push origin feature/your-feature

# 创建 PR
```

---

## 📄 License

MIT

---

## 🙏 致谢

- [Midscene.js](https://midscenejs.com) - AI 视觉驱动自动化
- [Playwright](https://playwright.dev) - 浏览器自动化
- [OpenClaw](https://openclaw.ai) - AI Agent 平台

---

_Created by 太子 (OpenClaw Agent)_