# dev.stereobreeze.ru 🚀

**Modern Portfolio Website** - Cyberpunk-themed developer portfolio with bilingual support

[![Deploy Status](https://img.shields.io/badge/deploy-passing-brightgreen)](https://dev.stereobreeze.ru)
[![Astro](https://img.shields.io/badge/Astro-5.15.1-FF5D01?logo=astro)](https://astro.build)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

**Author:** Alexey Shvedchikov ([@a1exs_dev](https://t.me/a1exs_dev))  
**Tech Stack:** Astro 5 • TypeScript • CSS3 • Yandex Cloud S3  
**Live Site:** [https://dev.stereobreeze.ru](https://dev.stereobreeze.ru)

## ✨ Features

- 🎨 **Cyberpunk Design** - Cyan/purple gradient theme with glitch effects
- 🌍 **Bilingual Support** - Russian/English with client-side switching (localStorage)
- 🎵 **Easter Egg** - Overtime modal with Spotify embed
- 🔍 **SEO Optimized** - Meta tags, Open Graph, JSON-LD, sitemap
- ⚡ **Performance** - Lighthouse 90+, lazy loading, optimized build
- 📱 **Fully Responsive** - Mobile-first design with touch support
- ♿ **Accessible** - ARIA labels, keyboard navigation, focus management

## 🚀 Quick Start

### Development

```sh
# Install dependencies
npm install

# Start local dev server at localhost:4321
npm run dev

# Build production site to ./dist/
npm run build

# Preview production build locally
npm run preview
```

### Deployment

```sh
# Deploy to Yandex Cloud S3 (requires configured AWS CLI)
./deploy.sh
```

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions.

## 📁 Project Structure

```text
/
├── public/          # Static assets (images, videos, fonts)
├── src/
│   ├── pages/       # Astro pages (.astro files)
│   └── components/  # Reusable Astro components
├── docs/            # Project documentation
│   ├── PRD.md                         # Product Requirements Document
│   ├── epics.md                       # Epic breakdown with 19 user stories
│   ├── technical-specification.md    # Detailed technical spec
│   └── bmm-workflow-status.md        # BMM workflow tracking
├── bmad/            # BMAD methodology configuration
└── package.json
```

## 📋 Documentation

- **[PRD.md](./docs/PRD.md)** - Product requirements, goals, functional/non-functional requirements
- **[epics.md](./docs/epics.md)** - 3 epics with 19 user stories for implementation
- **[technical-specification.md](./docs/technical-specification.md)** - Detailed technical specification (964 lines)
- **[bmm-workflow-status.md](./docs/bmm-workflow-status.md)** - Current workflow status and progress tracking

## 🎯 Project Overview

**Level 2 greenfield project** - Static portfolio website with cyberpunk aesthetic

**Key Features:**
- AI-generated hero video with glitch effects
- Cyberpunk visual style (neon glow, animated gradient background)
- Skills visualization with Dota 2-style star diagrams
- Glossy screenshot effects for portfolio projects
- Bilingual support (RU/EN)
- Snap-scroll navigation
- "Overtime" easter egg (Spotify modal)
- SEO optimized (Lighthouse 90+ target)

**Deployment:** Yandex Cloud S3 (static website hosting)

## 📊 Current Status

**Phase:** 2 - Planning (✅ PRD Complete)  
**Next:** Story 1.1 - Astro setup ✅ (In Progress)  
**Total Stories:** 19 across 3 epics

See [bmm-workflow-status.md](./docs/bmm-workflow-status.md) for detailed progress.

## 📄 License

Private project - All rights reserved © 2025 Alexey Shvedchikov
