# Medium Article Writing Framework

## Project Structure

```
/Users/roman/code/medium/
├── CLAUDE.md              # This file - Claude Code instructions
├── README.md              # Project overview
├── _dashboard.md          # Obsidian Dataview dashboard (pipeline, performance, tags)
├── _promotion-tracker.md  # Obsidian Dataview promotion status per platform
├── scripts/new-article.sh # Scaffold new articles (Obsidian-compatible)
├── shared/                # Reusable resources across all articles
│   ├── style-guide.md
│   ├── author-bio.md
│   ├── publishing-checklist.md
│   ├── templates/         # Per-article templates
│   │   ├── README.md           # Legacy template (replaced by index.md)
│   │   ├── article-plan.md
│   │   ├── article-outline.md
│   │   ├── social-media-posts.md
│   │   ├── preview-image-guide.md
│   │   ├── insights-data.md    # Template for article data & metrics
│   │   ├── metrics-log.md      # Template for post-publish tracking
│   │   └── draft-versions-guide.md  # Guide for draft version progression
│   ├── research/          # Shared research (e.g., article pattern analysis)
│   └── assets/            # Reusable assets (preview image HTML templates)
└── articles/              # All articles, one folder each
    └── YYYY-MM-topic-slug/
        ├── index.md       # Article index with YAML frontmatter (powers Dataview)
        ├── plan.md
        ├── outline.md
        ├── metrics-log.md # Post-publish engagement tracking
        ├── research/
        ├── insights/
        ├── drafts/
        ├── visuals/
        └── promotion/
```

## Obsidian Integration

This framework is designed to be used as an **Obsidian vault**. Open the `/Users/roman/code/medium/` folder as a vault in Obsidian.

### Required Plugin

- **Dataview** — Powers the `_dashboard.md` and `_promotion-tracker.md` pages with live tables

### Key Obsidian Features Used

1. **YAML Frontmatter** — Every article's `index.md` has frontmatter with status, tags, audience, metrics, and promotion booleans. Dataview queries this to build dashboards.

2. **`[[Wikilinks]]`** — Articles cross-reference each other and shared resources. Use the Obsidian graph view to see relationships between articles, research, and templates.

3. **Dataview Tables** — `_dashboard.md` shows pipeline overview, published performance, articles by tag, and monthly output. `_promotion-tracker.md` shows per-platform promotion status.

### Frontmatter Schema

Every article `index.md` must include this frontmatter:

```yaml
---
title: "Article Title"
slug: YYYY-MM-topic-slug
status: idea | planning | researching | outlining | drafting | reviewing | published | promoting
phase: planning | research | outline | draft | review | publish | promote
created: YYYY-MM-DD
published:              # fill when published
tags: [tag1, tag2]
audience: [developers, founders]
word-count: 0
read-time: 0
medium-url: ""
views: 0
claps: 0
comments: 0
shares: 0
linkedin-posted: false
twitter-posted: false
reddit-posted: false
hn-posted: false
devto-posted: false
---
```

### Updating Metrics After Publishing

1. Set `status: published` and fill `published:` date in frontmatter
2. Update `views`, `claps`, `comments`, `shares` periodically
3. Set platform booleans to `true` as you promote on each platform
4. Log detailed time-series data in `metrics-log.md`
5. Check `_dashboard.md` and `_promotion-tracker.md` for live overviews

## Naming Convention

Articles use `YYYY-MM-topic-slug` format for chronological sorting and readability.

Example: `2026-01-building-saas-claude-code`

## Workflow for New Articles

### 1. Scaffold

```bash
./scripts/new-article.sh YYYY-MM-topic-slug
```

This creates the full per-article folder structure with Obsidian-compatible templates, frontmatter, and wikilinks.

### 2. Plan

Edit `articles/YYYY-MM-topic-slug/plan.md`:
- Define audience and unique angle
- List differentiators vs. existing articles
- Identify key data points and metrics
- Set phases and milestones
- Update `index.md` frontmatter: `status: planning`, `phase: planning`

### 3. Research

Populate `articles/YYYY-MM-topic-slug/research/`:
- `sources.md` — URLs, reference articles, competitor content
- `notes.md` — Raw research notes, quotes, statistics
- Use `[[wikilinks]]` to link sources shared with other articles
- Update frontmatter: `status: researching`, `phase: research`

### 4. Outline

Edit `articles/YYYY-MM-topic-slug/outline.md`:
- Structure sections with word count targets
- Plan visuals (screenshots, diagrams, code snippets)
- Write section-level notes/prompts
- Update frontmatter: `status: outlining`, `phase: outline`

### 5. Draft

Write in `articles/YYYY-MM-topic-slug/drafts/`:
- Follow `shared/templates/draft-versions-guide.md` for version progression
- v1 (structure dump) -> v2 (structure edit) -> v3 (tone pass) -> v4 (final polish)
- Target 6-8 minutes read time (1,500-2,000 words)
- Follow `shared/style-guide.md` for tone and structure
- Update frontmatter: `status: drafting`, `phase: draft`, `word-count`, `read-time`

### 6. Visuals

Add to `articles/YYYY-MM-topic-slug/visuals/`:
- `screenshots/` — Product screenshots, UI captures
- `diagrams/` — Architecture diagrams, flow charts
- Use `shared/assets/preview-image.html` as starting point for preview images

### 7. Publish

Follow `shared/publishing-checklist.md`:
- Pre-publish review (fact-check, grammar, mobile preview)
- Medium formatting (title, subtitle, tags, preview image)
- Update frontmatter: `status: published`, `published: YYYY-MM-DD`, `medium-url`

### 8. Promote

Edit `articles/YYYY-MM-topic-slug/promotion/social-media-posts.md`:
- LinkedIn, Twitter/X, Reddit, HN, Dev.to posts
- Update frontmatter booleans as you post: `linkedin-posted: true`, etc.
- Track engagement in `metrics-log.md`
- Check `_promotion-tracker.md` for overview

## Writing Guidelines

- **Length**: 6-8 minutes (1,500-2,000 words)
- **Tone**: First-person, conversational, balanced (65% positive / 35% honest challenges)
- **Structure**: Hook -> Context -> Journey -> What Worked -> What Didn't -> Learnings -> Result -> CTA
- **Metrics**: Always include specific numbers, time transformations, percentages
- **Visuals**: 3-5 images, 1-2 code snippets, short paragraphs, bullet-heavy
- **CTAs**: Comment request, try-it-yourself invitation, community engagement
- **Drafts**: Follow version progression in `shared/templates/draft-versions-guide.md`

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

### View article pipeline
Open `_dashboard.md` in Obsidian (requires Dataview plugin)

### View promotion status
Open `_promotion-tracker.md` in Obsidian (requires Dataview plugin)

### Create preview image
1. Copy `shared/assets/preview-image.html` to article visuals folder
2. Edit title, stats, tagline for the specific article
3. Screenshot at 1200x630px
4. See `shared/templates/preview-image-guide.md` for detailed instructions

### Prepare social media posts
Use `shared/templates/social-media-posts.md` as starting template, customize for article content

### Track post-publish metrics
1. Update frontmatter in `index.md` with latest views/claps/comments/shares
2. Log time-series data in `metrics-log.md`
3. Check `_dashboard.md` for cross-article comparison
