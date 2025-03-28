# 🐢 ai-powered-turtle

Welcome to the vault of a slightly eccentric turtle with an AI-powered shell.  
This repo powers [Coderturtle](https://yourusername.github.io/ai-powered-turtle), a public knowledge lab built on Quartz — where software engineering, AI architecture, and mild chaos collide.

> "_If it ain’t broke, overengineer it anyway._" – Coderturtle

---

## 💡 What's in the Shell?

This project began as a structured Obsidian vault to track an AI-focused software architecture journey. It's now a living site deployed via [Quartz](https://github.com/jzhao/quartz), running on GitHub Pages.

### 🧠 Vault Focus:
The goal is to explore how AI impacts software development — from prompt engineering to system blueprints and vibe-driven dev logs.

---

## 🗂 Folder Breakdown

```
content/
├── 01-research/        # Whitepapers, future thinking, courses, articles
├── 02-prompts/         # General, dev, and research prompt kits
├── 03-projects/
│   └── turtle-trader-platform/
│       ├── business-plan/      # AI brokerage biz plan & pitch deck
│       ├── tech-plan/          # Discovery → design → build
│       ├── vibe-programming/   # Dev logs with turtle vibes
│       └── blog/               # Coding Horror–style build journey
├── 04-tools/          # Useful AI tools, APIs, libraries
├── 05-whiteboard/     # Freeform thinking, sketchpad chaos
├── dashboards/        # Dataview-style dashboards for vault navigation
├── how-to/            # Guides on tags, prompts, and vault usage
└── assets/            # Images, pitch decks, turtle art
```

---

## ⚙️ Setup Instructions

### 1. 🧠 Local Dev

> This repo assumes you’ve forked the [Quartz repo](https://github.com/jzhao/quartz) and dropped your vault content into the `content/` directory.

```bash
# Clone your fork
git clone https://github.com/yourname/ai-powered-turtle.git
cd ai-powered-turtle

# Install dependencies (Quartz uses Bun)
bun install

# Build the site
bun run build
```

### 2. 🌐 GitHub Pages Deployment

- A GitHub Actions workflow in `.github/workflows/deploy.yml` auto-builds and deploys your site every time you push to `main`.
- Pages settings: Set source to **GitHub Actions**
- Your site will be live at:
  ```
  https://yourusername.github.io/ai-powered-turtle/
  ```

---

## 🐢 Coderturtle Style

- Light/Dark theme with eccentric engineer quirks
- Footer: “Built by a turtle with an AI-powered shell”
- Dashboards powered by Dataview
- Prompts tagged and tracked for reuse
- Blog posts written like a caffeinated debugger ranting to a rubber duck

---

## 🛠 Future Plans

- Add comic strip sections (Among Us–style)
- Auto-generate pitch deck pages
- Build interactive architecture blueprints
- Add search, RSS, and site map support
- Possibly turtle merch? Who knows.

---

## 👋 Want to Contribute?

Pull requests welcome — as long as you're not faster than a turtle.  
This project thrives on good prompts, spicy diagrams, and poetic config files.

---

> Made with 🐢 by [Coderturtle](https://github.com/yourname) – wandering the AI jungle one blueprint at a time.
