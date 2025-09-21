# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Hugo-based static website for FINI (Flamingo Internet Navigators) consulting services. The site is built from converted TWiki content using Hugo with the PaperMod theme and deployed via GitHub Pages.

## Commands

### Essential Development Commands

- `just justsync` - Sync justfiles from www-chicks-net (run this first to get all commands)
- `just server` - Run Hugo development server locally
- `just see-server` - Open browser to Hugo site and start server
- `just hugo` - Build the site (production build)

### Content Development

- `just post <branchname>` - Create a new blog post with timestamp
- `just branch <branchname>` - Start a new feature branch with timestamp

### Pull Request Workflow

- `just pr` - Create PR with automated checks and watch for completion
- `just prweb` - View current PR in web browser
- `just merge` - Merge PR and return to main branch
- `just sync` - Return to main branch and pull latest changes

### Legacy TWiki Conversion

- `just twiki2hugo` - Convert TWiki .txt files to Hugo Markdown
- `just fix_twiki_headers` - Convert TWiki headers to Hugo frontmatter

### Linting

- `markdownlint-cli2 **/*.md` - Lint markdown files (configured in .markdownlint.yml)

## Site Architecture

### Content Structure

- `content/EdgeReports/` - Blog posts and company reports
- `content/FiniServices/` - Service descriptions and offerings
- `content/Archive/` - Legacy content from TWiki conversion
- `content/TermsAndConditions/` - Legal documents

### Hugo Configuration

- `hugo.toml` - Main Hugo configuration with PaperMod theme
- Theme uses profile mode with custom branding for FINI
- Excludes .txt files (legacy TWiki format)
- Configured for GitHub Pages deployment

### Development Process

1. All work happens on feature branches created with `just branch <name>`
2. PRs are created with `just pr` which builds the site and creates automated PR
3. GitHub Actions run markdownlint, actionlint, and Checkov security scans
4. Site deploys automatically to GitHub Pages on merge to main

### Key Files

- `justfile` - Local commands that import from www-chicks-net
- `.just/cache/` - Downloaded justfiles with full command suite
- `public/` - Generated Hugo site output
- `.markdownlint.yml` - Markdown linting configuration
- `.github/workflows/` - CI/CD pipeline definitions

## Content Guidelines

- Use Hugo frontmatter format (TOML) for metadata
- Images stored in `static/` directory
- Follow existing content structure patterns
- Legacy .txt files are ignored in builds but preserved for reference
