# Dojo Frontend Next - Instructions

## Quick Start
```bash
npm run dev    # Uses --webpack flag (turbopack breaks Tailwind v4 CSS)
```

## Critical Rules
1. **NO Tailwind classes for visuals** — use inline `style={{ }}` for colors, backgrounds, borders, shadows, padding
2. **Tailwind ONLY for layout** — flex, grid, gap, responsive (sm:, md:, lg:)
3. **Dark theme always** — see palette in global CLAUDE.md
4. **Framer Motion** for all animations — already installed
5. **Phosphor Icons** for all icons — already installed
6. **Ask for reference images** before designing new pages/components

## Stack
- Next.js 16.2 (App Router) + React 19 + TypeScript 5.9
- Tailwind CSS v4 (PostCSS-based) — layout only
- Framer Motion 12 — animations
- Phosphor Icons React — icons
- Fonts: Outfit (variable), JetBrains Mono (code)

## Project Structure
```
src/
├── app/
│   ├── layout.tsx              # Root layout + AuthProvider
│   ├── page.tsx                # Login/Register
│   ├── globals.css             # Tailwind import + custom styles
│   ├── dashboard/page.tsx      # User dashboard + belt progress
│   ├── exercises/
│   │   ├── page.tsx            # Exercise list (filterable by belt)
│   │   └── [id]/page.tsx       # Exercise detail
│   ├── study/[difficulty]/page.tsx   # Flashcard study
│   ├── quiz/[difficulty]/page.tsx    # Multiple choice quiz
│   ├── ranking/page.tsx        # Leaderboards (global/streaks/belts)
│   └── guia/page.tsx           # Tutorial guide
├── components/ui/
│   └── Navbar.tsx              # Fixed glassmorphism navbar
└── lib/
    ├── api.ts                  # Fetch wrapper with JWT Bearer token
    ├── auth-context.tsx        # Auth React Context (localStorage)
    └── belts.ts                # 6 belt levels with colors
```

## API
- Base URL: `NEXT_PUBLIC_API_URL` (default `http://localhost:8080`)
- Auth: Bearer token from localStorage (`dojo-user`)
- All `/api/content/**` and `/api/progress/**` routes require JWT

## Pending Work
- 9 premium animations: scroll reveals, page transitions, parallax, kinetic typography, staggered lists, quiz effects, scroll-driven video
- No ESLint or Prettier config yet
- No 3D/Three.js integration yet (was planned)
