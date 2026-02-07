# Medium Article Writing Framework

A structured framework for writing, publishing, and promoting Medium articles with consistent quality and process.

## Quick Start

### Create a new article

```bash
./scripts/new-article.sh 2026-03-your-topic-slug
```

This scaffolds the full article directory with templates for planning, outlining, drafting, and promoting.

### Write your article

1. **Plan** — Edit `plan.md` (audience, angle, differentiators)
2. **Research** — Add sources and notes to `research/`
3. **Outline** — Structure sections in `outline.md`
4. **Draft** — Write iteratively in `drafts/draft-v1.md`, `v2`, etc.
5. **Visuals** — Add screenshots and diagrams to `visuals/`
6. **Publish** — Follow `shared/publishing-checklist.md`
7. **Promote** — Customize posts in `promotion/social-media-posts.md`

## Project Structure

```
├── shared/                    # Reusable across all articles
│   ├── style-guide.md         # Writing best practices
│   ├── author-bio.md          # Bio versions and links
│   ├── publishing-checklist.md
│   ├── templates/             # Per-article templates
│   ├── research/              # Shared research references
│   └── assets/                # Preview image HTML templates
│
├── articles/                  # One folder per article
│   └── YYYY-MM-topic-slug/
│       ├── README.md          # Status and links
│       ├── plan.md            # Audience and angle
│       ├── outline.md         # Section structure
│       ├── research/          # Sources and notes
│       ├── insights/          # Metrics and data
│       ├── drafts/            # Draft versions
│       ├── visuals/           # Screenshots and diagrams
│       └── promotion/         # Social media posts
│
└── scripts/
    └── new-article.sh         # Article scaffolding
```

## Shared Resources

| Resource | Description |
|----------|-------------|
| [Style Guide](shared/style-guide.md) | Writing best practices distilled from article analysis |
| [Author Bio](shared/author-bio.md) | Short/long bio versions, links, hashtags |
| [Publishing Checklist](shared/publishing-checklist.md) | Pre-publish, formatting, SEO, promotion steps |
| [Preview Image Guide](shared/templates/preview-image-guide.md) | Creating 1200x630px social preview images |

## Articles

| Article | Status |
|---------|--------|
| [Building a Production SaaS with Claude Code](articles/2026-01-building-saas-claude-code/) | Draft complete |

## Naming Convention

Articles follow `YYYY-MM-topic-slug` format for chronological sorting and readability.
