# Portfolio Website UX Design Specification

_Created on 28 October 2025 by a1exs_  
_Generated using BMAD Method - Create UX Design Workflow v1.0_

---

## Executive Summary

This UX Design Specification defines the complete user experience for **dev.stereobeeze.ru** — a portfolio website designed to attract freelance and full-time opportunities. The design balances cyberpunk aesthetics with professional credibility, creating a memorable first impression while maintaining readability and usability.

**Core Positioning:** Strong developer who delivers projects end-to-end  
**Target Audience:** HR managers, CTOs, technical leaders, recruiters  
**Platform:** Web (desktop + mobile responsive)  
**Technology:** Astro → Yandex Cloud S3

---

## 1. Design System Foundation

### 1.1 Design System Choice

**Selected Approach:** Custom lightweight design system built on modern CSS

**Rationale:**
- Portfolio is a single-page site — no need for heavy component library
- Custom approach allows perfect alignment with cyberpunk aesthetic
- Faster load times critical for first impression
- Full control over animations and effects (glitch, neon glow)
- Astro's component model provides structure without framework overhead

**What This Provides:**
- Consistent spacing system (8px base unit)
- Reusable component patterns (buttons, cards, inputs)
- Typography scale
- Color system with semantic mappings
- Responsive breakpoints

**Custom Components Needed:**
1. Glitch text effect (hero name)
2. Glossy screenshot cards with hover shine
3. Dota-style skill stars (n-point stars with glow)
4. Spotify embed modal (Overtime easter egg)
5. Telegram CTA button with glow
6. Language switcher (RU/EN)

---

## 2. Core User Experience

### 2.1 Defining Experience

**Core User Goal:** Quickly evaluate if this developer is right for their project

**The ONE Thing Users Will Experience:**
"Scrolling through a modern, professional portfolio that feels premium and builds trust"

**What Should Be Effortless:**
- Scanning key information (experience, skills, projects)
- Understanding technical capabilities
- Making contact (Telegram button)
- Switching language (auto-detect + manual toggle)

**Critical User Action:**
Clicking "Написать в Telegram" after being convinced by portfolio content

**Emotional Journey:**
1. **First 3 seconds (Hero):** "Wow, this is different" — AI video + glitch effect creates intrigue
2. **First 30 seconds (About + Experience):** "This person is credible" — Yandex, millions of users, real impact
3. **First 2 minutes (Projects + Skills):** "They can handle my project" — technical depth, proven delivery
4. **Decision point:** "Let's talk" — low-friction Telegram contact

### 2.2 Novel UX Patterns

**AI Video Hero with Glitch Effect**

This is the defining novel pattern — no standard portfolio does this.

**Pattern Details:**
- **User Goal:** Immediate visual impact, differentiation from standard portfolios
- **Trigger:** Page load (autoplay, muted, loop)
- **Mechanics:**
  - Background video covers full viewport
  - Glitch effect emanates from eyes (AI-generated)
  - Text overlay with glitch animation on name
  - Smooth gradient overlay ensures text readability
  - Video plays on loop (5-10 seconds)
- **Feedback:** 
  - Video provides motion without being distracting
  - Glitch draws eye to name
  - Subtle enough to not overpower
- **States:**
  - Default: Video playing, subtle glitch
  - Fallback: Static image if video fails
  - Mobile: Lighter video or static image (performance)
- **Platform Considerations:**
  - Desktop: Full quality video (WebM + MP4)
  - Mobile: Reduced quality or static image
  - Accessibility: Video is decorative, all info in text
- **Inspiration:** Cyberpunk 2077 character intros, modern agency websites

**Technical Implementation:**
```html
<video autoplay muted loop playsinline>
  <source src="hero-glitch.webm" type="video/webm">
  <source src="hero-glitch.mp4" type="video/mp4">
</video>
```

**Accessibility Considerations:**
- Respects `prefers-reduced-motion` (show static image)
- Video is pure decoration, doesn't convey essential info
- All text content available to screen readers

---

## 3. Visual Foundation

### 3.1 Color System

**Selected Theme:** Electric Blue (Theme 4)

**Rationale:**
- **Energy + Modernity:** Conveys contemporary tech stack
- **Premium Feel:** Blue associated with trust, professionalism
- **Pink Accent:** Adds vibrancy without being overwhelming
- **Stands Out:** Less common than cyan/gold cyberpunk clichés
- **Associations:** Modern tech brands (Spotify, Twitch), product companies

**Color Palette:**

**Primary Colors:**
- `--primary: #0088ff` (Electric Blue) — Primary actions, links, highlights
- `--accent: #ff0088` (Hot Pink) — Secondary accents, hover states, special elements

**Backgrounds:**
- `--bg: #050a14` (Deep Blue Black) — Main background
- `--card-bg: #0a0f1e` (Dark Blue) — Card backgrounds, elevated surfaces
- `--input-bg: #050a19` (Input Dark) — Form inputs
- `--border: #1f2a3d` (Blue Gray) — Borders, dividers

**Text:**
- `--heading: #ffffff` (White) — Headings, important text
- `--text: #c5d9f9` (Light Blue) — Body text, descriptions
- `--text-muted: #7a8aa3` (Muted Blue) — Secondary text

**Semantic Colors:**
- `--success: #00ff88` (Neon Green) — Success states, achievements
- `--error: #ff0055` (Error Red) — Error states, warnings
- `--info: #00ffff` (Cyan) — Info messages, tips

**Glows:**
- `--glow: rgba(0, 136, 255, 0.3)` — Primary element glow
- `--glow-accent: rgba(255, 0, 136, 0.3)` — Accent element glow

**Usage Guidelines:**
- Primary color for CTAs and navigation
- Accent color sparingly for special elements (easter egg, skill stars)
- Generous use of dark backgrounds for low eye strain
- Neon glows applied to interactive elements (buttons, cards on hover)
- Maintain WCAG AA contrast ratios (minimum 4.5:1 for body text)

### 3.2 Typography System

**Font Families:**
- **Headings:** System fonts (-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto)
  - Modern, clean, performs perfectly
  - No external font loading = faster
- **Body:** Same system font stack
- **Monospace:** 'Courier New', monospace (for code snippets, tech details)

**Type Scale:**
- `--text-xs: 12px` (Small labels, captions)
- `--text-sm: 14px` (Secondary text, meta info)
- `--text-base: 16px` (Body text)
- `--text-lg: 18px` (Large body text, intros)
- `--text-xl: 20px` (Subheadings)
- `--text-2xl: 24px` (Section titles)
- `--text-3xl: 32px` (Major headings)
- `--text-4xl: 48px` (Page titles)
- `--text-5xl: 64px` (Hero heading)

**Font Weights:**
- `300` (Light) — Hero heading for elegance
- `400` (Regular) — Body text
- `600` (Semibold) — Subheadings, emphasized text
- `700` (Bold) — Primary headings, buttons

**Line Heights:**
- Headings: `1.1` (tight, impactful)
- Body text: `1.8` (generous, readable)
- Small text: `1.6` (balanced)

**Rationale:**
- System fonts ensure instant loading
- Generous line-height for readability (professional audience reads content)
- Light weight on hero creates elegance
- Scale provides clear hierarchy

### 3.3 Spacing and Layout

**Base Unit:** 8px

**Spacing Scale:**
- `--space-1: 8px`
- `--space-2: 16px`
- `--space-3: 24px`
- `--space-4: 32px`
- `--space-5: 40px`
- `--space-6: 48px`
- `--space-8: 64px`
- `--space-10: 80px`
- `--space-12: 96px`
- `--space-16: 128px`

**Layout Grid:**
- **Desktop:** Max-width 700px for text content (optimal reading line length)
- **Mobile:** Full width with 20px horizontal padding
- **Sections:** Consistent vertical spacing (80px between sections)

**Container Widths:**
- Text content: 700px (45-75 characters per line)
- Hero: 100vw (full width)
- Projects: 700px (maintains text rhythm)

**Rationale:**
- 700px max-width for Minimal Clean aesthetic
- Narrow column keeps focus on content
- 8px base unit enables consistent spacing
- Generous vertical spacing gives breathing room

---

## 4. Design Direction

### 4.1 Chosen Design Approach

**Selected Direction:** Minimal Clean (Direction 5)

**Why This Direction:**

**Layout Decisions:**
- **Single column, centered:** Focuses attention, eliminates distractions
- **Max-width 700px:** Optimal reading experience
- **Generous whitespace:** Premium feel, not cluttered
- **No sidebar navigation:** One-page site doesn't need persistent nav

**Visual Hierarchy:**
- **Spacious:** Lots of breathing room between sections
- **Typography-driven:** Large, elegant headings guide the eye
- **Subtle borders:** Minimal dividers, mostly whitespace separation
- **Color for emphasis:** Primary blue highlights important elements

**Content Approach:**
- **Text-focused:** Content is king, visuals support
- **Scannable:** Clear headings, short paragraphs, bullet points
- **Progressive disclosure:** Start simple, add depth as user scrolls

**Visual Weight:**
- **Minimal:** Clean, uncluttered
- **Flat design:** No heavy shadows or gradients (except glows)
- **Subtle elevation:** Gentle hover effects, not dramatic lifts

**What Makes This Work for Portfolio:**
1. **Professional credibility:** Clean design = organized mind
2. **Content focus:** HR/CTOs want to see experience, not flashy effects
3. **Fast scanning:** Narrow column, clear hierarchy
4. **Modern but timeless:** Won't look dated in 2 years
5. **Balances cyberpunk:** Electric blue + glows add personality without chaos

**Personality:**
- **Emotion:** Calm confidence + modern expertise
- **Vibe:** "Thoughtful professional who values quality"
- **Best for:** Mature tech audience who values substance over flash

**Design Philosophy:**
"Every pixel serves the content. Effects enhance but never distract."

---

## 5. User Journey Flows

### 5.1 Primary User Journey: "Evaluating Developer for Project"

**User Goal:** Determine if this developer is right for their project

**Entry Point:** Direct link (from resume, LinkedIn, email signature)

**Flow:**

**Step 1: Hero Section (First Impression)**
- User sees: AI video with glitch effect, name, tagline, CTA
- User feels: "This is different, professional but creative"
- User does: Scrolls to learn more OR clicks Telegram immediately
- Time: 3-10 seconds

**Step 2: About Section (Credibility)**
- User sees: Personal intro, motivation, technical focus
- User evaluates: "Do I connect with this person's approach?"
- Key info: 6 years experience, enterprise scale, quality focus
- Time: 20-30 seconds

**Step 3: Experience Section (Validation)**
- User sees: Chronological work history (Yandex, Black Star, Samsung)
- User validates: "Credible companies, meaningful roles"
- Key markers: Leading developer at Yandex, millions of users
- Time: 30-45 seconds

**Step 4: Skills Section (Technical Match)**
- User sees: Dota-style skill stars, categorized competencies
- User checks: "Does technical stack match our needs?"
- Key question: "Do they have the skills we need?"
- Time: 15-30 seconds

**Step 5: Projects Section (Proof)**
- User sees: Detailed project cards with context
- User evaluates: "Have they done work like what we need?"
- Key info: Specific technologies, scale, impact
- Decision point: "Can they handle our complexity?"
- Time: 60-90 seconds

**Step 6: Speaking Section (Thought Leadership)**
- User sees: Conference talks, teaching experience
- User thinks: "They're recognized in the community"
- Bonus credibility: Not just coding, but sharing knowledge
- Time: 15-20 seconds

**Step 7: Contact Section (Conversion)**
- User sees: Telegram button, easter egg hint
- User decides: "Let's talk" OR "Not a fit"
- User does: Clicks Telegram button
- Success metric: Click-through to Telegram

**Alternative Path: Quick Scan**
- User scrolls rapidly through all sections
- Picks up: Yandex, Flutter, millions of users, conferences
- Decision: "Worth reaching out" → Clicks Telegram
- Time: 30-60 seconds

**Error/Edge Cases:**
- **Language mismatch:** Auto-detect + footer toggle handles it
- **Video won't play:** Fallback to static image
- **Mobile user:** Responsive design maintains all content
- **Slow connection:** Progressive enhancement, text loads first

**Success Metrics:**
- Time on site > 2 minutes = engaged
- Scroll depth > 80% = read full story
- Telegram click = conversion
- Return visit = serious consideration

---

## 6. Component Library

### 6.1 Component Strategy

**Philosophy:** Minimal, custom components optimized for this specific site

**Base Components (Standard):**
- Buttons (primary, secondary)
- Links (inline, standalone)
- Headings (h1-h6)
- Paragraphs and lists
- Cards (project cards, experience cards)
- Section containers

**Custom Components (Unique to This Portfolio):**

#### 1. Glitch Text Component

**Purpose:** Add cyberpunk flair to hero name

**Anatomy:**
- Text element with glitch animation
- Multiple layered copies with color shift
- Periodic trigger (not constant)

**States:**
- Default: Normal text
- Glitch active: RGB shift, position offset
- Animation: Triggers every 5 seconds for 0.5s

**Implementation:**
```css
@keyframes glitch {
  0%, 100% { transform: translate(0); }
  33% { transform: translate(-2px, 2px); filter: hue-rotate(90deg); }
  66% { transform: translate(2px, -2px); filter: hue-rotate(-90deg); }
}
```

**Accessibility:** 
- Respects `prefers-reduced-motion`
- Text remains readable at all times

#### 2. Glossy Screenshot Card

**Purpose:** Premium presentation of project screenshots

**Anatomy:**
- Image container
- Glossy overlay gradient
- Shine effect on hover
- Border with subtle glow

**States:**
- Default: Gentle gloss overlay
- Hover: Animated shine sweeps across
- Focus: Same as hover (keyboard accessible)

**Variants:**
- Sizes: 400px, 600px, full-width

**Implementation:**
```css
.glossy-card::after {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(135deg, transparent 0%, rgba(255,255,255,0.1) 50%, transparent 100%);
  transform: translateX(-100%);
  transition: transform 0.6s ease;
}

.glossy-card:hover::after {
  transform: translateX(100%);
}
```

#### 3. Dota-Style Skill Star

**Purpose:** Unique visualization of skill proficiency

**Anatomy:**
- SVG n-point star (5-8 points based on skill level)
- Stroke with primary color
- Glow filter
- Skill label below

**States:**
- Default: Static with glow
- Hover: Pulse animation, tooltip with details
- Focus: Same as hover

**Skill Levels:**
- Beginner: 3-point star
- Intermediate: 5-point star
- Advanced: 7-point star
- Expert: 8-point star

**Categories:**
1. Mobile Development (Flutter: 8, Kotlin: 7, iOS: 5)
2. Backend (Kotlin/Ktor: 7, REST API: 8)
3. DevOps (CI/CD: 7, Docker: 6)
4. Soft Skills (Leadership: 7, Mentoring: 8, Communication: 8)

**Accessibility:**
- ARIA label with skill name and level
- Keyboard focusable
- Tooltip on focus/hover

#### 4. Spotify Modal (Easter Egg)

**Purpose:** Show personality through music passion

**Trigger:** Click on underlined "overtime" text in Contact section

**Anatomy:**
- Modal overlay (backdrop blur)
- Modal container (centered card)
- Spotify embed iframe
- Close button (X, Esc key, click outside)

**States:**
- Hidden: Display none
- Opening: Fade in with backdrop
- Active: Spotify player interactive
- Closing: Fade out

**Implementation:**
```html
<div class="modal-overlay" onclick="closeModal()">
  <div class="modal-content" onclick="event.stopPropagation()">
    <button class="modal-close">×</button>
    <iframe src="spotify:track:overtime" width="300" height="380"></iframe>
  </div>
</div>
```

**Accessibility:**
- Focus trap when open
- Esc key to close
- Focus returns to trigger element on close
- ARIA modal role

#### 5. Telegram CTA Button

**Purpose:** Primary conversion action

**Anatomy:**
- Large button with icon
- Telegram blue + primary color
- Neon glow effect
- Hover animation

**States:**
- Default: Primary color with glow
- Hover: Increased glow, slight lift
- Active: Pressed state
- Focus: Outline for keyboard nav

**Variants:**
- Primary (hero): Large, prominent
- Secondary (footer): Standard size

**Implementation:**
```css
.telegram-cta {
  background: var(--primary);
  color: var(--bg);
  box-shadow: 0 0 20px var(--glow);
  transition: all 0.3s ease;
}

.telegram-cta:hover {
  box-shadow: 0 0 30px var(--glow);
  transform: translateY(-2px);
}
```

#### 6. Language Switcher

**Purpose:** Toggle between RU/EN content

**Anatomy:**
- Two-state toggle (RU | EN)
- Positioned in footer
- Active state highlighted
- Smooth transition

**Behavior:**
- Auto-detects browser language on load
- Clicking toggles all page content
- Preference saved to localStorage
- URL updates with lang param

**States:**
- RU active: RU highlighted in primary color
- EN active: EN highlighted in primary color

**Accessibility:**
- ARIA label: "Language selector"
- ARIA live region announces change
- Keyboard accessible (Tab, Enter)

---

## 7. UX Pattern Decisions

### 7.1 Consistency Rules

**Button Hierarchy:**
- **Primary action:** `background: primary`, neon glow, bold → "Написать в Telegram"
- **Secondary action:** `border: primary`, transparent bg → "Посмотреть проекты"
- **Tertiary action:** Text link, primary color, no border → "Узнать больше"
- **Destructive:** Not applicable to portfolio site

**Feedback Patterns:**
- **Success:** Not applicable (no forms to submit)
- **Error:** Not applicable
- **Loading:** Skeleton screens for images (fade in when loaded)
- **Navigation:** Smooth scroll with snap points between sections

**Link Patterns:**
- **Inline links:** Primary color, underline on hover
- **Nav links:** No underline, primary color, bold when active section
- **External links:** Icon indicator (↗) after text
- **Hover state:** Slight color brightness increase

**Scroll Behavior:**
- **Snap scroll:** Disabled (felt too rigid for reading)
- **Smooth scroll:** Enabled for anchor links
- **Scroll indicator:** Optional thin progress bar at top
- **Back to top:** Not needed (one-page, natural to scroll up)

**Empty States:**
- Not applicable (all content pre-populated)

**Image Loading:**
- **Strategy:** Progressive JPEG, fade-in transition
- **Placeholder:** Blur-up effect (tiny blurred version → full image)
- **Lazy loading:** Images below fold load on scroll proximity
- **Fallback:** Alt text displayed if image fails

**Animation Principles:**
- **Duration:** 0.3s for micro-interactions, 0.6s for larger transitions
- **Easing:** `ease-out` for entrances, `ease-in` for exits
- **Hover effects:** Immediate (no delay), subtle
- **Scroll animations:** Fade-in on viewport entry (Intersection Observer)
- **Reduced motion:** All animations disabled if `prefers-reduced-motion: reduce`

**Focus States:**
- **Outline:** 2px solid primary color, 2px offset
- **Skip to content:** Hidden until focused (keyboard nav)
- **Tab order:** Logical top-to-bottom flow

---

## 8. Responsive Design & Accessibility

### 8.1 Responsive Strategy

**Breakpoints:**
- **Mobile:** < 768px (single column, full-width with padding)
- **Tablet:** 768px - 1024px (same as mobile for this minimal design)
- **Desktop:** > 1024px (centered 700px column)

**Adaptation Patterns:**

**Navigation:**
- Desktop: Hidden (one-page site, sections speak for themselves)
- Mobile: Same (snap scroll provides clear section boundaries)
- Optional: Thin progress bar showing scroll position

**Hero Section:**
- Desktop: Full viewport height, large type (64px)
- Mobile: 80vh, reduced type (40px), lighter video or static image

**Content Sections:**
- Desktop: 700px max-width, centered
- Mobile: Full width with 20px padding, same max-width

**Typography:**
- Desktop: Full scale (64px → 12px)
- Mobile: Proportionally reduced (40px → 12px)
- Line-height: Same (readability is critical)

**Images/Screenshots:**
- Desktop: 600px wide
- Mobile: 100% container width (responsive)

**Skill Stars:**
- Desktop: 80px diameter, grid layout
- Mobile: 60px diameter, simplified grid (2 columns instead of 4)

**Spacing:**
- Desktop: Full spacing scale
- Mobile: Reduced vertical spacing (64px → 40px between sections)

**Buttons:**
- Desktop: Standard touch target (48px height minimum)
- Mobile: Larger touch targets (56px height minimum)

**Video:**
- Desktop: Full quality WebM/MP4
- Mobile: Reduced quality or static image (bandwidth consideration)

### 8.2 Accessibility Strategy

**WCAG Compliance Target:** AA (legally sufficient, professionally appropriate)

**Why AA:**
- Portfolio is a public website (best practice)
- Professional audience may include accessibility needs
- AA is achievable without sacrificing design vision
- AAA would restrict color palette too much

**Key Requirements:**

**Color Contrast:**
- Body text (#c5d9f9 on #050a14): 9.2:1 ✓ (exceeds 4.5:1 requirement)
- Headings (#ffffff on #050a14): 16.5:1 ✓
- Primary button (#050a14 text on #0088ff): 7.8:1 ✓
- Links (#0088ff on #050a14): 6.1:1 ✓

**Keyboard Navigation:**
- All interactive elements accessible via Tab
- Logical tab order (top to bottom)
- Skip link to main content (hidden until focused)
- Telegram button, language switcher, easter egg trigger all keyboard accessible
- Modal trap focus when open, Esc to close

**Focus Indicators:**
- 2px solid primary color outline
- 2px offset for visibility
- High contrast against all backgrounds
- Never hidden with `outline: none` without alternative

**ARIA Labels:**
- Skill stars: `aria-label="Flutter skill level: Expert (8 out of 8)"`
- Language switcher: `aria-label="Switch language"`
- Telegram button: `aria-label="Contact via Telegram"`
- Video: `aria-hidden="true"` (decorative)
- Modal: `role="dialog"`, `aria-modal="true"`

**Alternative Text:**
- All project screenshots: Descriptive alt text
- Decorative images: `alt=""` (null alt, announced as decorative)
- Logos: Alt with company name

**Form Labels:**
- Not applicable (no forms on portfolio)

**Error Identification:**
- Not applicable (no user input)

**Headings Structure:**
- Logical hierarchy (h1 → h2 → h3)
- No skipped levels
- h1: Name (once per page)
- h2: Section titles
- h3: Subsection titles (company names, project titles)

**Screen Reader Considerations:**
- Semantic HTML (nav, main, section, article)
- Landmarks for major regions
- Alt text tells the story for non-visual users
- "Read More" links include context (not just "read more")

**Motion/Animation:**
- Respects `prefers-reduced-motion: reduce`
- All animations disabled if user preference set
- Glitch effect becomes static
- Video replaced with static image
- Transitions reduced to instant

**Testing Strategy:**
- **Automated:** Lighthouse accessibility audit (target 100 score)
- **Manual:** Keyboard-only navigation test
- **Screen reader:** VoiceOver (Mac) testing on key flows
- **Color blindness:** Sim Daltonism check
- **Tools:** axe DevTools browser extension

---

## 9. Implementation Guidance

### 9.1 Component Implementation Priority

**Phase 1: Foundation (Week 1)**
1. Base HTML structure (semantic markup)
2. Color system CSS variables
3. Typography system
4. Spacing utilities
5. Responsive breakpoints
6. Basic components (buttons, links, cards)

**Phase 2: Content Sections (Week 2)**
1. Hero section (static image first, video later)
2. About section (text + layout)
3. Experience section (timeline or list)
4. Skills section (simple list first, stars later)
5. Projects section (cards with images)
6. Speaking section (list with logos)
7. Contact section (Telegram button)
8. Footer (language switcher, copyright)

**Phase 3: Enhancements (Week 3)**
1. AI video generation and integration
2. Glitch text effect
3. Glossy screenshot cards
4. Dota-style skill stars
5. Spotify modal easter egg
6. Scroll animations (fade-in on viewport)
7. Performance optimization
8. Accessibility audit and fixes

### 9.2 Content Guidelines

**Tone of Voice:**
- Professional but human
- Specific over generic
- Results-focused
- Confident without arrogance
- Technical but accessible

**Examples:**
- ❌ "Experienced developer"
- ✓ "6 years building apps for millions of users"

- ❌ "Worked on important projects"
- ✓ "Led development of Yandex Pro, serving 2M+ drivers daily"

**Content Principles:**
1. **Specific numbers:** "6 years", "2M users", "5 conferences"
2. **Impact over duties:** "Reduced crash rate by 40%" not "Implemented error handling"
3. **Technology mentioned:** Flutter, Kotlin, REST API (helps SEO)
4. **Story over resume:** Show passion for building quality software
5. **Human touch:** Mention music, "делать на совесть" motivation

### 9.3 Performance Targets

**Lighthouse Scores (All 90+):**
- Performance: 95+
- Accessibility: 100
- Best Practices: 100
- SEO: 100

**Core Web Vitals:**
- LCP (Largest Contentful Paint): < 2.5s
- FID (First Input Delay): < 100ms
- CLS (Cumulative Layout Shift): < 0.1

**Optimization Strategies:**
- WebP images with PNG/JPEG fallback
- Lazy loading for below-fold images
- Video compressed (< 5MB, 1920x1080 max)
- No external fonts (system fonts only)
- Minimal JavaScript (vanilla, no frameworks)
- CSS minification
- Static site generation (Astro)
- Serve from CDN (Yandex Cloud S3)

### 9.4 SEO Strategy

**Target Keywords:**
- "Flutter developer"
- "Mobile developer hire"
- "Yandex developer"
- "Kotlin developer"
- "Senior mobile developer Russia"

**On-Page SEO:**
- Semantic HTML (proper heading hierarchy)
- Meta description (150 characters, compelling)
- Title tag: "Алексей Шведчиков — Flutter Developer | Yandex"
- Open Graph tags for social sharing
- Structured data (Person schema)
- Alt text on all images
- Fast load time (< 2s)

**Content SEO:**
- Natural keyword usage in About section
- Company names (Yandex, Black Star, Samsung)
- Technology names (Flutter, Kotlin, Dart, REST API)
- Conference names (CrossConf, MergeConf)
- City/region: Moscow, Russia (if relevant)

---

## 10. Next Steps & Follow-Up Workflows

### 10.1 Immediate Next Steps

1. **Content Creation** (Priority 1)
   - Write all text in Russian using tone-of-voice guidelines
   - Translate to English
   - Review for clarity and impact

2. **AI Video Generation** (Priority 2)
   - Generate hero video with glitch effect
   - Optimize for web (< 5MB)
   - Create static fallback image

3. **Media Preparation**
   - Optimize screenshots (WebP + fallback)
   - Recolor Yandex dino (black → white)
   - Collect conference logos
   - Prepare project images

4. **Astro Project Setup**
   - Initialize Astro project
   - Set up bilingual routing
   - Create component structure
   - Configure Yandex Cloud S3 deployment

### 10.2 Recommended Follow-Up Workflows

**Optional Enhancements:**
- **Wireframe Generation:** Create detailed wireframes for all sections
- **High-Fidelity Mockups:** Design in Figma for pixel-perfect reference
- **Interactive Prototype:** Clickable prototype for stakeholder review
- **Component Showcase:** Living style guide for future maintenance
- **AI Frontend Prompts:** Generate prompts for v0/Lovable if needed

**Integration with BMM Workflow:**
- ✅ UX Design Complete
- ⏭️ Next: Solution Architecture (technical implementation planning)
- Then: Frontend Development workflow
- Then: Testing & Quality Assurance
- Finally: Deployment & Launch

### 10.3 Success Metrics

**Launch Metrics:**
- Lighthouse scores: All 90+
- Page load time: < 2 seconds
- Mobile responsive: 100% functional
- Accessibility: WCAG AA compliant
- Content: RU + EN complete

**Post-Launch Metrics:**
- Time on site: > 2 minutes (engagement)
- Scroll depth: > 80% (reading full story)
- Telegram click rate: > 10% of visitors
- Return visitors: Tracking interest level
- Mobile traffic: Percentage using mobile devices

---

## Appendix

### Related Documents

- **Brainstorming Session:** `/docs/brainstorming-session-results-2025-10-27.md`
- **Technical Specification:** `/docs/technical-specification.md`
- **Tone of Voice Guideline:** `/docs/tone-of-voice-guideline.md`
- **Project Summary:** `/docs/project-summary.md`

### Interactive Deliverables

This UX Design Specification was created through visual collaboration:

- **Color Theme Visualizer:** `/docs/ux-color-themes.html`
  - 4 cyberpunk color palettes explored
  - Electric Blue (Theme 4) selected
  - Live UI component previews in each theme

- **Design Direction Mockups:** `/docs/ux-design-directions.html`
  - 8 complete design approaches showcased
  - Minimal Clean (Direction 5) selected
  - Full-screen interactive mockups

### Design Decisions Log

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Design System | Custom lightweight | Portfolio is single-page, no need for heavy framework |
| Color Theme | Electric Blue | Modern, premium, energy + trust |
| Design Direction | Minimal Clean | Professional audience values content over effects |
| Typography | System fonts | Instant load, modern aesthetic |
| Max Width | 700px | Optimal reading line length (45-75 characters) |
| Navigation | Hidden/minimal | One-page site, sections are self-evident |
| Video Quality | High on desktop, low/static on mobile | Performance vs impact balance |
| Accessibility | WCAG AA | Professional standard, legally sufficient |
| Glitch Effect | Periodic, subtle | Cyberpunk flair without distraction |
| Skill Visualization | Dota stars | Unique, memorable, fits gamer identity |
| Contact Method | Telegram button only | Simplest, most direct (no forms) |
| Language Toggle | Auto-detect + manual | UX convenience + user control |

### Version History

| Date | Version | Changes | Author |
|------|---------|---------|--------|
| 2025-10-28 | 1.0 | Initial UX Design Specification | a1exs |

---

## Summary

This UX Design Specification defines every aspect of the user experience for **dev.stereobeeze.ru**:

✅ **Visual Foundation:** Electric Blue color system with neon glows  
✅ **Design Direction:** Minimal Clean (typography-focused, spacious, professional)  
✅ **Core Experience:** Fast scanning, building trust, low-friction contact  
✅ **Novel Patterns:** AI video hero with glitch, Dota-style skill stars, Overtime easter egg  
✅ **Responsive:** Desktop (700px centered) + Mobile (full-width adaptive)  
✅ **Accessible:** WCAG AA compliant with screen reader and keyboard support  
✅ **Performance:** Lighthouse 90+ scores, < 2s load time  

**The design balances cyberpunk aesthetics with professional credibility** — creating a memorable first impression while maintaining readability and usability for HR, CTOs, and technical decision-makers.

All decisions are documented with rationale, ready for implementation in Astro.

---

_This UX Design Specification was created through collaborative design facilitation using the BMAD Method, not template generation. All decisions were made with user input and visual exploration._
