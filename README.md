# Super Browser Skill

Unified browser automation platform with AI vision, Playwright, DevTools, and content extraction.

## Features

- AI Vision Control (Midscene)
- Precise Automation (Playwright)
- Debug & Analysis (DevTools)
- Content Extraction (Web Clipper)
- Fast CLI (agent-browser)

## Install

```bash
npx skills add luze1011/super-browser-skill --yes --global
```

## Quick Start

```bash
# AI Vision
npx @midscene/web@1 connect --url https://github.com
npx @midscene/web@1 act --prompt "Search for OpenClaw"

# Playwright
playwright-cli open https://github.com
playwright-cli snapshot
```

## License

MIT

Created by TaiZi (OpenClaw Agent)
