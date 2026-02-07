# Medium Article Writing Framework

## Project Structure

```
/Users/roman/code/medium/
├── CLAUDE.md              # This file - Claude Code instructions
├── README.md              # Project overview
├── scripts/new-article.sh # Scaffold new articles
├── shared/                # Reusable resources across all articles
│   ├── style-guide.md
│   ├── author-bio.md
│   ├── publishing-checklist.md
│   ├── templates/         # Per-article templates
│   ├── research/          # Shared research (e.g., article pattern analysis)
│   └── assets/            # Reusable assets (preview image HTML templates)
└── articles/              # All articles, one folder each
    └── YYYY-MM-topic-slug/
```

## Naming Convention

Articles use `YYYY-MM-topic-slug` format for chronological sorting and readability.

Example: `2026-01-building-saas-claude-code`

## Workflow for New Articles

### 1. Scaffold

```bash
./scripts/new-article.sh YYYY-MM-topic-slug
```

This creates the full per-article folder structure with populated templates.

### 2. Plan

Edit `articles/YYYY-MM-topic-slug/plan.md`:
- Define audience and unique angle
- List differentiators vs. existing articles
- Identify key data points and metrics
- Set phases and milestones

### 3. Research

Populate `articles/YYYY-MM-topic-slug/research/`:
- `sources.md` — URLs, reference articles, competitor content
- `notes.md` — Raw research notes, quotes, statistics

### 4. Outline

Edit `articles/YYYY-MM-topic-slug/outline.md`:
- Structure sections with word count targets
- Plan visuals (screenshots, diagrams, code snippets)
- Write section-level notes/prompts

### 5. Draft

Write in `articles/YYYY-MM-topic-slug/drafts/`:
- Start with `draft-v1.md`, increment versions
- Target 6-8 minutes read time (1,500-2,000 words)
- Follow `shared/style-guide.md` for tone and structure

### 6. Visuals

Add to `articles/YYYY-MM-topic-slug/visuals/`:
- `screenshots/` — Product screenshots, UI captures
- `diagrams/` — Architecture diagrams, flow charts
- Use `shared/assets/preview-image.html` as starting point for preview images

### 7. Publish

Follow `shared/publishing-checklist.md`:
- Pre-publish review (fact-check, grammar, mobile preview)
- Medium formatting (title, subtitle, tags, preview image)
- Post-publish promotion (social media, cross-posting)

### 8. Promote

Edit `articles/YYYY-MM-topic-slug/promotion/social-media-posts.md`:
- LinkedIn, Twitter/X, Reddit, HN, Dev.to posts
- Track engagement in `promotion/post-publish-notes.md`

## Writing Guidelines

- **Length**: 6-8 minutes (1,500-2,000 words)
- **Tone**: First-person, conversational, balanced (65% positive / 35% honest challenges)
- **Structure**: Hook -> Context -> Journey -> What Worked -> What Didn't -> Learnings -> Result -> CTA
- **Metrics**: Always include specific numbers, time transformations, percentages
- **Visuals**: 3-5 images, 1-2 code snippets, short paragraphs, bullet-heavy
- **CTAs**: Comment request, try-it-yourself invitation, community engagement

See `shared/style-guide.md` for full details.

## Common Tasks

### Create a new article
```bash
./scripts/new-article.sh 2026-03-my-new-topic
```

### Review style guide before writing
Read `shared/style-guide.md`

### Check publishing readiness
Follow `shared/publishing-checklist.md`

### Create preview image
1. Copy `shared/assets/preview-image.html` to article visuals folder
2. Edit title, stats, tagline for the specific article
3. Screenshot at 1200x630px
4. See `shared/templates/preview-image-guide.md` for detailed instructions

### Prepare social media posts
Use `shared/templates/social-media-posts.md` as starting template, customize for article content
