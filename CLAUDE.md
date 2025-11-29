# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is Fred's Shed NZ website (fredsshednz.com) - a static personal website built with SvelteKit and deployed via Cloudflare Workers serving content from Backblaze B2 storage.

## Development Commands

### Setup
```bash
npm install
```

### Development
```bash
npm run dev          # Start dev server with hot reload
./devlive.sh        # Alternative: Start dev server
```

### Building
```bash
npm run build       # Production build (outputs to ./build)
./build.sh         # Alternative: Production build
```

### Preview
```bash
npm run preview     # Preview production build locally
./preview.sh       # Alternative: Preview build
```

### Type Checking
```bash
npm run check              # Run Svelte type checking
npm run check:watch        # Run type checking in watch mode
```

### Publishing
```bash
./publish.sh       # Build and deploy to B2 + update Cloudflare Worker
```

## Architecture

### Static Site Generation
- **Framework**: SvelteKit with `@sveltejs/adapter-static`
- **Prerendering**: All routes are prerendered (`export const prerender = true` in `src/routes/+layout.js`)
- **Output**: Static files in `./build` directory

### Component Structure
- **Layout**: `src/routes/+layout.svelte` provides app-wide layout with fade-in animation on mount
- **Page**: `src/routes/+page.svelte` imports and composes sections:
  - `Header.svelte`
  - `WatchSection.svelte`
  - `FollowSection.svelte`
  - `SupportSection.svelte`
  - `ContactSection.svelte`
  - `Footer.svelte`
- **Components**: Organized in `src/lib/components/`
- **Assets**: Static images in `static/images/`

### Styling
- **Framework**: Tailwind CSS v4
- **Setup**: Configured via `@tailwindcss/vite` plugin in `vite.config.ts`
- **Global styles**: `src/app.css`

### Deployment Architecture
1. **Build**: SvelteKit generates static files
2. **Storage**: Files uploaded to Backblaze B2 bucket with versioned paths (git commit + timestamp)
3. **CDN**: Cloudflare Worker proxies requests to B2

### Cloudflare Worker
- **Location**: `cloudflare-worker/index.js`
- **Purpose**: Proxy requests to B2 storage using S3-compatible API signatures
- **Security**: Only allows GET requests for specific paths (`index.html`, `_app/*`, `images/*`)
- **Path rewriting**: Root `/` redirects to `index.html`
- **Authentication**: Uses AWS4 signatures with B2 credentials

## Publishing Process

The `publish.sh` script:
1. Validates required environment variables (all prefixed with `FREDSSHEDNZ_`):
   - `FREDSSHEDNZ_B2_Bucket_Name`: B2 bucket name
   - `FREDSSHEDNZ_B2_Profile`: B2 CLI profile
   - `FREDSSHEDNZ_B2_APPLICATION_KEY_ID`: B2 application key ID (exported as `B2_APPLICATION_KEY_ID` for B2 CLI)
   - `FREDSSHEDNZ_B2_APPLICATION_KEY`: B2 application key (exported as `B2_APPLICATION_KEY` for B2 CLI)
   - `FREDSSHEDNZ_CloudFlare_API_Token`: Cloudflare API token (exported as `CLOUDFLARE_API_TOKEN` for Wrangler)
2. Exports tool-consumed variables with original names so B2 CLI and Wrangler can read them
3. Runs production build
4. Uploads to versioned B2 path: `SiteContent/<git-describe>-<timestamp>`
5. Updates Cloudflare Worker secret `B2_BUCKET_PATH` to point to new version

Note: The script exports `B2_APPLICATION_KEY_ID`, `B2_APPLICATION_KEY`, and `CLOUDFLARE_API_TOKEN` from their prefixed versions because these are consumed directly by the B2 CLI and Wrangler tools.

## Key Configuration Files

- `svelte.config.js`: SvelteKit config with static adapter
- `vite.config.ts`: Vite config with Tailwind plugin
- `tsconfig.json`: TypeScript configuration
- `package.json`: Dependencies and npm scripts

## Fonts

Uses @fontsource packages:
- `@fontsource/inter`
- `@fontsource/montserrat`
