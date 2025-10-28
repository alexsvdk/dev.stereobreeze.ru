# Portfolio Website - Epic Breakdown

**Author:** a1exs
**Date:** 2025-10-28
**Project Level:** 2
**Target Scale:** Medium project (15-19 stories)

---

## Overview

This document provides the detailed epic breakdown for Portfolio Website, expanding on the high-level epic list in the [PRD](./PRD.md).

Each epic includes:
- Expanded goal and value proposition
- Complete story breakdown with user stories
- Acceptance criteria for each story
- Story sequencing and dependencies

**Epic Sequencing Principles:**
- Epic 1 establishes foundational infrastructure and initial functionality
- Subsequent epics build progressively, each delivering significant end-to-end value
- Stories within epics are vertically sliced and sequentially ordered
- No forward dependencies - each story builds only on previous work

---

## Epic 1: Project Foundation & Core Structure

### Expanded Goal

Establish the development infrastructure and create a deployable skeleton website with all sections in place. This epic delivers a working (though unstyled) single-page site that can be viewed in a browser, setting the foundation for all subsequent visual and interactive enhancements.

By the end of this epic, the project has a functional Astro setup, version control, and basic HTML structure for all content sections, leaving the system in a working state ready for styling.

### Stories

**Story 1.1: Initialize Astro Project and Development Environment**

As a developer,
I want to set up an Astro project with proper configuration,
So that I have a solid foundation for building a static portfolio site.

**Acceptance Criteria:**
1. Astro project initialized with `npm create astro@latest`
2. Project structure includes src/, public/, and configuration files
3. Development server runs successfully on localhost
4. Basic package.json configured with necessary scripts (dev, build, preview)
5. .gitignore configured for node_modules and build artifacts
6. README.md updated with project description and setup instructions

**Prerequisites:** None

---

**Story 1.2: Create GitHub Repository and Initial Commit**

As a developer,
I want to set up version control with GitHub,
So that code is backed up and ready for CI/CD integration.

**Acceptance Criteria:**
1. GitHub repository created at github.com/alexsvdk/dev.stereobreeze.ru
2. Local git initialized and connected to remote repository
3. Initial commit includes Astro project setup
4. Main branch configured and pushed to remote
5. Repository README visible on GitHub

**Prerequisites:** Story 1.1

---

**Story 1.3: Build Basic HTML Structure for All Sections**

As a developer,
I want to create semantic HTML structure for all portfolio sections,
So that content is organized and accessible even without styling.

**Acceptance Criteria:**
1. Index page (src/pages/index.astro) contains all sections: Hero, About, Experience, Skills, Portfolio, Speaking, Contact, Footer
2. Each section wrapped in semantic HTML5 tags (<header>, <section>, <footer>)
3. Section IDs added for navigation (e.g., id="about", id="experience")
4. Basic heading hierarchy (h1, h2, h3) established
5. Placeholder content added to each section
6. Page validates with HTML5 validator (no errors)

**Prerequisites:** Story 1.2

---

**Story 1.4: Add Russian Content to All Sections**

As a site visitor,
I want to see actual Russian content in all sections,
So that I can understand the developer's background and skills.

**Acceptance Criteria:**
1. Hero section contains name "Алексей Шведчиков" and tagline
2. About section includes 3-4 paragraphs of personal text
3. Experience section lists Yandex, Black Star, Samsung with positions and periods
4. Skills section lists skill categories (Mobile, Backend, DevOps, Soft Skills)
5. Portfolio section describes Yandex Pro, Era of Change, WowChef projects
6. Speaking section lists conferences and lectures
7. Contact section includes Telegram CTA and social links
8. Footer includes copyright notice
9. All content follows tone-of-voice guideline (professional, confident, approachable)

**Prerequisites:** Story 1.3

---

**Story 1.5: Implement Basic Typography and Color Foundations**

As a site visitor,
I want text to be readable with basic styling,
So that I can consume content comfortably even before full design implementation.

**Acceptance Criteria:**
1. CSS reset or normalize applied
2. Base font family set (system fonts as fallback)
3. Dark background color (#0a0a0a) applied to body
4. Light text color (#FFFFFF) for readability
5. Heading font sizes defined (h1: 2.5rem, h2: 2rem, h3: 1.5rem)
6. Body text size set to 1.125rem with line-height 1.6
7. Maximum width constraint (e.g., 1200px) for readability on large screens
8. Basic spacing between sections (margin/padding)

**Prerequisites:** Story 1.4

---

**Story 1.6: Add Navigation Menu with Scroll-to-Section**

As a site visitor,
I want to click navigation links and smoothly scroll to sections,
So that I can easily explore different parts of the portfolio.

**Acceptance Criteria:**
1. Fixed navigation bar created at top of page
2. Navigation links for all sections (About, Experience, Skills, Portfolio, Speaking, Contact)
3. Clicking nav link smoothly scrolls to corresponding section
4. Active section highlighted in navigation (basic implementation)
5. Navigation has dark background with light text for visibility
6. Navigation remains accessible via keyboard (tab navigation works)

**Prerequisites:** Story 1.3

---

## Epic 2: Cyberpunk Visual Effects & Responsive Design

### Expanded Goal

Transform the basic HTML structure into a visually distinctive cyberpunk-themed portfolio with neon effects, glitch animations, and full responsive behavior. This epic delivers the site's unique visual identity that differentiates it from typical developer portfolios.

By the end of this epic, the site has a complete cyberpunk aesthetic with all visual effects functional, looks great on all devices, and provides an engaging interactive experience.

### Stories

**Story 2.1: Implement Cyberpunk Color Palette and Neon Glow Effects**

As a site visitor,
I want to see cyberpunk-themed colors with neon glow,
So that the portfolio has a distinctive and memorable visual identity.

**Acceptance Criteria:**
1. Color palette CSS variables defined (cyan #00FFFF, yellow #FFD700, backgrounds, text colors)
2. Neon glow text-shadow applied to all h1 and h2 headings
3. Glow effect uses cyan primary color with appropriate blur radius
4. Neon effect is subtle and doesn't reduce readability
5. Primary CTA button (Telegram) has prominent neon glow on hover
6. Section dividers or accents use neon colors

**Prerequisites:** Story 1.5

---

**Story 2.2: Create Animated Gradient Background**

As a site visitor,
I want to see a slowly animating gradient background,
So that the site feels dynamic and futuristic.

**Acceptance Criteria:**
1. CSS gradient background applied to body with dark purple/blue tones
2. Gradient animates slowly (30-60 second cycle) using CSS keyframes
3. Animation is smooth and doesn't impact performance
4. Gradient is subtle and doesn't distract from content
5. Animation respects prefers-reduced-motion media query (disables for users who prefer reduced motion)

**Prerequisites:** Story 2.1

---

**Story 2.3: Add AI-Generated Hero Video Background**

As a site visitor,
I want to see an eye-catching AI-generated video in the hero section,
So that I immediately recognize the portfolio's creative and technical sophistication.

**Acceptance Criteria:**
1. Video element added to hero section as background
2. Video files in WebM (primary) and MP4 (fallback) formats
3. Video autoplays, loops, and is muted
4. Poster image (fallback) displays if video doesn't load
5. Video size optimized (< 5MB)
6. Overlay gradient applied for text readability
7. Video is lazy-loaded if not in viewport initially
8. Mobile devices show static poster image instead of video to save bandwidth

**Prerequisites:** Story 2.2

---

**Story 2.4: Implement Glitch Effect on Hero Heading**

As a site visitor,
I want to see a periodic glitch effect on the main heading,
So that the cyberpunk theme is reinforced with dynamic visual interest.

**Acceptance Criteria:**
1. Glitch effect CSS animation created (text distortion/offset)
2. Animation triggers periodically (every 8-10 seconds)
3. Animation duration is brief (0.2-0.3 seconds)
4. Effect doesn't obscure text during most viewing time
5. Animation uses CSS transforms for performance
6. Effect respects prefers-reduced-motion (disabled for sensitive users)
7. Glitch works on hero h1 element with name

**Prerequisites:** Story 2.3

---

**Story 2.5: Create Skills Visualization with Dota 2-Style Stars**

As a site visitor,
I want to see skills visualized as interactive star diagrams,
So that I can quickly understand skill levels in an engaging way.

**Acceptance Criteria:**
1. Each skill category rendered as SVG star polygon
2. Star points represent skill level (more points filled = higher level)
3. Four categories displayed: Mobile Development, Backend, DevOps, Soft Skills
4. Hover on star highlights and shows tooltip with skill details
5. Stars have neon glow effect matching theme
6. Animation draws stars on scroll into view
7. On mobile, simplified layout (smaller stars or list fallback)

**Prerequisites:** Story 2.1

---

**Story 2.6: Implement Glossy Screenshot Effect for Portfolio Projects**

As a site visitor,
I want to see project screenshots with glossy effect and hover animation,
So that project visuals are presented in a premium, engaging way.

**Acceptance Criteria:**
1. Project screenshots wrapped in container with CSS pseudo-elements
2. Glossy reflection overlay created using linear gradient
3. Hover triggers shine/glare animation across image
4. Screenshots have subtle shadow and border for depth
5. Effect works for all project images (Yandex Pro, Era of Change, WowChef)
6. Images optimized (WebP format with PNG fallback)
7. Lazy loading applied to all project images

**Prerequisites:** Story 2.5

---

**Story 2.7: Make Site Fully Responsive for Mobile and Tablet**

As a mobile/tablet user,
I want the portfolio to look great and function well on my device,
So that I can explore the portfolio comfortably regardless of screen size.

**Acceptance Criteria:**
1. Mobile breakpoint (320px-767px) styles implemented
2. Tablet breakpoint (768px-1023px) styles implemented
3. Navigation switches to hamburger menu on mobile
4. Single column layout on mobile, appropriate columns on tablet/desktop
5. Font sizes scale appropriately for each breakpoint
6. Images and videos responsive (max-width: 100%, height: auto)
7. Touch targets for buttons/links are at least 44x44px
8. Horizontal scrolling prevented on all breakpoints
9. Site tested on real devices (iOS Safari, Android Chrome)

**Prerequisites:** Story 2.6

---

**Story 2.8: Implement Snap-Scroll Between Sections**

As a site visitor,
I want smooth snap-scrolling between sections,
So that navigation feels polished and intentional.

**Acceptance Criteria:**
1. CSS scroll-snap properties applied to main container
2. Each section snaps into view when scrolling
3. Smooth scrolling behavior enabled
4. Snap works on both manual scroll and navigation link clicks
5. Snap behavior disabled on mobile if it causes usability issues
6. Scroll position indicator (optional) shows current section

**Prerequisites:** Story 2.7

---

## Epic 3: Bilingual Support & Production Polish

### Expanded Goal

Add English language support, optimize for search engines and performance, implement final interactive features, and deploy to production. This epic delivers a fully polished, production-ready site that reaches both Russian and international audiences with excellent performance.

By the end of this epic, the site is live on dev.stereobreeze.ru, fully bilingual, SEO-optimized, and meets all performance targets.

### Stories

**Story 3.1: Add English Content and Language Switcher**

As an international visitor,
I want to read the portfolio in English,
So that I can understand the developer's background without language barriers.

**Acceptance Criteria:**
1. All content translated to English (About, Experience, Skills, Portfolio, Speaking, Contact)
2. Content files organized (e.g., content-ru.json, content-en.json)
3. Language switcher added to footer (RU | EN)
4. Clicking switcher toggles all content to selected language
5. Language preference saved in localStorage
6. Browser language auto-detected on first visit (navigator.language)
7. Fallback to Russian if browser language not RU/EN
8. URL doesn't change when switching languages (single URL for both)

**Prerequisites:** Story 2.8

---

**Story 3.2: Implement Overtime Easter Egg Modal**

As a site visitor,
I want to click the "overtime" text and see a Spotify modal,
So that I can discover the developer's personality through a fun easter egg.

**Acceptance Criteria:**
1. Contact section text includes underlined "overtime" link
2. Clicking "overtime" opens modal with Spotify iframe embed
3. Modal has dark backdrop with blur effect
4. Spotify player loads the "Overtime" track
5. Modal closes when clicking backdrop, close button, or pressing ESC key
6. Modal traps focus for accessibility (keyboard users can't tab outside)
7. Spotify iframe lazy-loads (only loads when modal opens)
8. Modal is accessible (proper ARIA attributes)

**Prerequisites:** Story 3.1

---

**Story 3.3: Implement SEO Optimization and Meta Tags**

As a search engine or social media platform,
I want to see proper meta tags and structured data,
So that the portfolio is discoverable and displays correctly in search results and shares.

**Acceptance Criteria:**
1. Title tag optimized: "Алексей Шведчиков — Flutter Developer | Turnkey Projects"
2. Meta description compelling and keyword-rich (< 160 characters)
3. Open Graph tags for social sharing (og:title, og:description, og:image, og:url)
4. Twitter Card meta tags configured
5. Canonical URL set to https://dev.stereobreeze.ru
6. JSON-LD structured data for Person schema implemented
7. robots.txt allows all crawling
8. Sitemap.xml generated (optional for single-page, but good practice)
9. Favicon added (multiple sizes)

**Prerequisites:** Story 3.2

---

**Story 3.4: Optimize Performance and Achieve Lighthouse 90+ Score**

As a site visitor,
I want the site to load quickly and perform smoothly,
So that I have an excellent user experience regardless of connection speed.

**Acceptance Criteria:**
1. All images optimized and converted to WebP (with fallbacks)
2. Video optimized (< 5MB, appropriate compression)
3. CSS minified and critical CSS inlined
4. JavaScript minified (if any)
5. Fonts preloaded or using font-display: swap
6. Lazy loading implemented for images below fold
7. Lighthouse performance score 90+
8. Lighthouse accessibility score 90+
9. Lighthouse best practices score 90+
10. Lighthouse SEO score 90+
11. Core Web Vitals in green zone (LCP, FID, CLS)

**Prerequisites:** Story 3.3

---

**Story 3.5: Deploy to Yandex Cloud S3 and Configure Domain**

As a developer,
I want the site deployed to production on dev.stereobreeze.ru,
So that it's publicly accessible to potential clients and employers.

**Acceptance Criteria:**
1. Yandex Cloud S3 bucket created and configured for static website hosting
2. Build process runs successfully (npm run build)
3. Dist files uploaded to S3 bucket
4. Bucket permissions set to public read access
5. Domain dev.stereobreeze.ru configured to point to S3 bucket
6. SSL certificate configured (HTTPS enabled)
7. Site accessible at https://dev.stereobreeze.ru
8. All pages and resources load correctly in production
9. Cache-Control headers configured for assets

**Prerequisites:** Story 3.4

---

## Story Guidelines Reference

**Story Format:**

```
**Story [EPIC.N]: [Story Title]**

As a [user type],
I want [goal/desire],
So that [benefit/value].

**Acceptance Criteria:**
1. [Specific testable criterion]
2. [Another specific criterion]
3. [etc.]

**Prerequisites:** [Dependencies on previous stories, if any]
```

**Story Requirements:**
- **Vertical slices** - Complete, testable functionality delivery
- **Sequential ordering** - Logical progression within epic
- **No forward dependencies** - Only depend on previous work
- **AI-agent sized** - Completable in 2-4 hour focused session
- **Value-focused** - Integrate technical enablers into value-delivering stories

---

**Total Stories: 19**
- Epic 1: 6 stories
- Epic 2: 8 stories
- Epic 3: 5 stories

**For implementation:** Use the `create-story` workflow to generate individual story implementation plans from this epic breakdown.
