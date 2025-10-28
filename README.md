# dev.stereobreeze.ru

Portfolio website - cyberpunk-themed developer portfolio built with Astro.

**Author:** Alexey Shvedchikov (a1exs)  
**Tech Stack:** Astro + CSS + Yandex Cloud S3

## 🚀 Development

All commands are run from the root of the project:

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
