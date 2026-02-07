# Medium Article Writing Framework

A structured framework for writing, publishing, and promoting Medium articles with consistent quality and process. Built as an **Obsidian vault** with Dataview-powered dashboards for tracking article pipeline and performance.

## Quick Start

### Prerequisites

1. Open this folder as a vault in [Obsidian](https://obsidian.md)
2. Install the [Dataview](https://github.com/blacksmithgu/obsidian-dataview) community plugin
3. Enable Dataview in Obsidian settings

### Create a new article

```bash
./scripts/new-article.sh 2026-03-your-topic-slug
```

This scaffolds the full article directory with:
- `index.md` with YAML frontmatter (powers Dataview dashboards)
- `[[wikilinks]]` connecting to shared resources and related articles
- `metrics-log.md` for post-publish engagement tracking
- Templates for planning, outlining, drafting, and promoting

### Write your article

1. **Plan** — Edit `plan.md` (audience, angle, differentiators)
2. **Research** — Add sources and notes to `research/`
3. **Outline** — Structure sections in `outline.md`
4. **Draft** — Write iteratively following `shared/templates/draft-versions-guide.md` (v1 -> v2 -> v3 -> v4)
5. **Visuals** — Add screenshots and diagrams to `visuals/`
6. **Publish** — Follow `shared/publishing-checklist.md`
7. **Promote** — Customize posts in `promotion/social-media-posts.md`
8. **Track** — Update frontmatter metrics, log data in `metrics-log.md`

### Track everything

- Open `_dashboard.md` in Obsidian for pipeline overview, performance metrics, and tag-based views
- Open `_promotion-tracker.md` for per-platform promotion status

## Project Structure

```
├── _dashboard.md              # Dataview dashboard (pipeline, performance, tags)
├── _promotion-tracker.md      # Dataview promotion status per platform
├── shared/                    # Reusable across all articles
│   ├── style-guide.md         # Writing best practices
│   ├── author-bio.md          # Bio versions and links
│   ├── publishing-checklist.md
│   ├── templates/
│   │   ├── article-plan.md
│   │   ├── article-outline.md
│   │   ├── social-media-posts.md
│   │   ├── preview-image-guide.md
│   │   ├── insights-data.md        # Data & metrics template
│   │   ├── metrics-log.md          # Post-publish tracking template
│   │   └── draft-versions-guide.md # Draft version progression guide
│   ├── research/              # Shared research references
│   └── assets/                # Preview image HTML templates
│
├── articles/                  # One folder per article
│   └── YYYY-MM-topic-slug/
│       ├── index.md           # YAML frontmatter + status (powers Dataview)
│       ├── plan.md            # Audience and angle
│       ├── outline.md         # Section structure
│       ├── metrics-log.md     # Post-publish engagement tracking
│       ├── research/          # Sources and notes
│       ├── insights/          # Metrics and data
│       ├── drafts/            # Draft versions (v1 -> v2 -> v3 -> v4)
│       ├── visuals/           # Screenshots and diagrams
│       └── promotion/         # Social media posts
│
└── scripts/
    └── new-article.sh         # Article scaffolding (Obsidian-compatible)
```

## Obsidian Features

### Dataview Dashboards

| Dashboard | What It Shows |
|-----------|---------------|
| [`_dashboard.md`](_dashboard.md) | Pipeline overview, published performance, articles by tag, monthly output, totals |
| [`_promotion-tracker.md`](_promotion-tracker.md) | Per-platform promotion status, completion rate, unpromoted articles |

### YAML Frontmatter

Every article's `index.md` has structured frontmatter that Dataview queries:

```yaml
status: idea | planning | researching | outlining | drafting | reviewing | published
tags: [ai, claude-code, saas]
audience: [developers, founders]
views: 0          # update after publishing
claps: 0
linkedin-posted: false  # flip to true as you promote
```

### Wikilinks

All article files cross-reference each other and shared resources with `[[wikilinks]]`. Use Obsidian's graph view to visualize relationships between articles, research, and templates.

## Shared Resources

| Resource | Description |
|----------|-------------|
| [Style Guide](shared/style-guide.md) | Writing best practices distilled from article analysis |
| [Author Bio](shared/author-bio.md) | Short/long bio versions, links, hashtags |
| [Publishing Checklist](shared/publishing-checklist.md) | Pre-publish, formatting, SEO, promotion steps |
| [Draft Versions Guide](shared/templates/draft-versions-guide.md) | What each draft version focuses on (v1-v4) |
| [Insights Data Template](shared/templates/insights-data.md) | Template for article data & metrics |
| [Preview Image Guide](shared/templates/preview-image-guide.md) | Creating 1200x630px social preview images |

## Articles

| Article | Status |
|---------|--------|
| [Building a Production SaaS with Claude Code](articles/2026-01-building-saas-claude-code/) | Draft complete |

## Naming Convention

Articles follow `YYYY-MM-topic-slug` format for chronological sorting and readability.
