#!/bin/bash
set -euo pipefail

# Medium Article Scaffolding Script (Obsidian-compatible)
# Usage: ./scripts/new-article.sh YYYY-MM-topic-slug
#
# Creates an Obsidian-ready article folder with:
# - index.md with YAML frontmatter (powers Dataview dashboards)
# - Wikilink placeholders for cross-referencing
# - metrics-log.md for post-publish tracking
# - All standard article workflow files

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATES_DIR="$ROOT_DIR/shared/templates"
ARTICLES_DIR="$ROOT_DIR/articles"

# --- Validation ---

if [ $# -eq 0 ]; then
    echo "Usage: $0 YYYY-MM-topic-slug"
    echo "Example: $0 2026-03-building-with-ai"
    exit 1
fi

SLUG="$1"

# Validate format: YYYY-MM-topic-slug
if ! echo "$SLUG" | grep -qE '^[0-9]{4}-[0-9]{2}-[a-z0-9]([a-z0-9-]*[a-z0-9])?$'; then
    echo "Error: Invalid format. Expected YYYY-MM-topic-slug"
    echo "  - Must start with YYYY-MM (e.g., 2026-03)"
    echo "  - Topic slug must be lowercase alphanumeric with hyphens"
    echo "  - Example: 2026-03-building-with-ai"
    exit 1
fi

ARTICLE_DIR="$ARTICLES_DIR/$SLUG"

if [ -d "$ARTICLE_DIR" ]; then
    echo "Error: Article directory already exists: $ARTICLE_DIR"
    exit 1
fi

# --- Create directory structure ---

echo "Creating article: $SLUG"

mkdir -p "$ARTICLE_DIR"/{research,insights,drafts,visuals/{screenshots,diagrams},promotion}

# --- Extract metadata from slug ---

YEAR_MONTH=$(echo "$SLUG" | grep -oE '^[0-9]{4}-[0-9]{2}')
TOPIC=$(echo "$SLUG" | sed "s/^[0-9]*-[0-9]*-//")
TITLE_CASE_TOPIC=$(echo "$TOPIC" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')
DATE=$(date +%Y-%m-%d)

# --- index.md (replaces README.md — Obsidian primary note with frontmatter) ---

cat > "$ARTICLE_DIR/index.md" << EOF
---
title: "$TITLE_CASE_TOPIC"
slug: $SLUG
status: idea
phase: planning
created: $DATE
published:
tags: []
audience: []
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

# $TITLE_CASE_TOPIC

<!-- Brief description of this article -->

## Status

- [ ] Research
- [ ] Planning
- [ ] Outline
- [ ] Draft v1
- [ ] Draft v2 (refined)
- [ ] Draft v3 (tone pass)
- [ ] Draft v4 (final polish)
- [ ] Visuals
- [ ] Publishing
- [ ] Promotion

## Quick Reference

- **Topic**: $TITLE_CASE_TOPIC
- **Target audience**: <!-- define your audience -->
- **Target length**: 6-8 minutes (1,500-2,000 words)
- **Created**: $DATE

## Links

- Medium article: <!-- add after publishing -->
- Product/project: <!-- add relevant link -->

## Key Metrics for This Article

<!-- Fill in the specific numbers and data points this article will feature -->
-
-
-

## Related

- [[style-guide]] — Writing guidelines
- [[draft-versions-guide]] — Version progression reference
- [[publishing-checklist]] — Pre-publish and promotion steps
- Related articles: <!-- add [[wikilinks]] to related articles -->

## File Locations

- **Plan:** \`plan.md\`
- **Outline:** \`outline.md\`
- **Latest draft:** \`drafts/draft-v1.md\`
- **Data & metrics:** \`insights/data.md\`
- **Social media posts:** \`promotion/social-media-posts.md\`
- **Metrics log:** \`metrics-log.md\`

## Notes

<!-- Any quick notes, decisions, or reminders -->
EOF

# --- Plan ---

sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/article-plan.md" > "$ARTICLE_DIR/plan.md"

# Add wikilinks header to plan
sed -i '' "1s/^/Related: [[$SLUG\/index|Article Index]] | [[style-guide]] | [[article-analysis]]\n\n/" "$ARTICLE_DIR/plan.md" 2>/dev/null || true

# --- Outline ---

sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/article-outline.md" > "$ARTICLE_DIR/outline.md"

# Add wikilinks header to outline
sed -i '' "1s/^/Related: [[$SLUG\/index|Article Index]] | [[$SLUG\/plan|Plan]] | [[style-guide]] | [[draft-versions-guide]]\n\n/" "$ARTICLE_DIR/outline.md" 2>/dev/null || true

# --- Social media posts ---

sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/social-media-posts.md" > "$ARTICLE_DIR/promotion/social-media-posts.md"

# Add wikilinks header to social media posts
sed -i '' "1s/^/Related: [[$SLUG\/index|Article Index]] | [[$SLUG\/metrics-log|Metrics Log]] | [[_promotion-tracker]]\n\n/" "$ARTICLE_DIR/promotion/social-media-posts.md" 2>/dev/null || true

# --- Metrics log (from template) ---

cp "$TEMPLATES_DIR/metrics-log.md" "$ARTICLE_DIR/metrics-log.md"

# --- Insights data (from template) ---

sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/insights-data.md" > "$ARTICLE_DIR/insights/data.md"

# Add wikilinks header to insights
sed -i '' "1s/^/Related: [[$SLUG\/index|Article Index]] | [[$SLUG\/plan|Plan]] | [[$SLUG\/outline|Outline]]\n\n/" "$ARTICLE_DIR/insights/data.md" 2>/dev/null || true

# --- Research placeholders ---

cat > "$ARTICLE_DIR/research/sources.md" << EOF
Related: [[$SLUG/index|Article Index]] | [[$SLUG/research/notes|Research Notes]] | [[article-analysis]]

# Sources & References

## Articles to Analyze

<!-- Add URLs of similar/competing articles -->
-
-
-

## Documentation

<!-- Add relevant documentation links -->
-

## Data Sources

<!-- Add links to data, stats, or research -->
-
EOF

cat > "$ARTICLE_DIR/research/notes.md" << EOF
Related: [[$SLUG/index|Article Index]] | [[$SLUG/research/sources|Sources]] | [[article-analysis]]

# Research Notes

<!-- Raw research notes, quotes, statistics -->

## Key Findings

-

## Interesting Quotes

-

## Patterns Noticed

-
EOF

# --- Draft v1 ---

cat > "$ARTICLE_DIR/drafts/draft-v1.md" << EOF
# $TITLE_CASE_TOPIC

<!-- Draft v1 - $DATE -->
<!-- Target: 6-8 minutes (1,500-2,000 words) -->
<!-- Refer to outline.md for structure -->
<!-- See [[draft-versions-guide]] for version progression -->

EOF

# --- Promotion post-publish notes ---

cat > "$ARTICLE_DIR/promotion/post-publish-notes.md" << EOF
Related: [[$SLUG/index|Article Index]] | [[$SLUG/metrics-log|Metrics Log]] | [[_promotion-tracker]]

# Post-Publish Notes

## Engagement Metrics

| Platform | Date | Views | Engagement | Notes |
|----------|------|-------|------------|-------|
| Medium   |      |       |            |       |
| LinkedIn |      |       |            |       |
| Twitter  |      |       |            |       |
| Reddit   |      |       |            |       |

## What Worked

-

## What Didn't

-

## Learnings for Next Article

-
EOF

# --- Summary ---

echo ""
echo "Article scaffolded at: $ARTICLE_DIR"
echo ""
echo "Directory structure:"
echo "  $SLUG/"
echo "  ├── index.md               # Article index with YAML frontmatter (Obsidian/Dataview)"
echo "  ├── plan.md                # Audience, angle, phases"
echo "  ├── outline.md             # Section structure"
echo "  ├── metrics-log.md         # Post-publish engagement tracking"
echo "  ├── research/"
echo "  │   ├── sources.md         # URLs and references"
echo "  │   └── notes.md           # Raw research notes"
echo "  ├── insights/"
echo "  │   └── data.md            # Metrics and examples"
echo "  ├── drafts/"
echo "  │   └── draft-v1.md        # First draft"
echo "  ├── visuals/"
echo "  │   ├── screenshots/"
echo "  │   └── diagrams/"
echo "  └── promotion/"
echo "      ├── social-media-posts.md"
echo "      └── post-publish-notes.md"
echo ""
echo "Obsidian features:"
echo "  - YAML frontmatter powers _dashboard.md and _promotion-tracker.md"
echo "  - [[wikilinks]] connect to shared resources and related articles"
echo "  - Update frontmatter 'status' and 'phase' as you progress"
echo "  - Update frontmatter metrics after publishing for dashboard tracking"
echo ""
echo "Next steps:"
echo "  1. Edit index.md — update title, tags, and audience in frontmatter"
echo "  2. Edit plan.md — define audience and angle"
echo "  3. Add sources to research/sources.md"
echo "  4. Structure outline.md with sections"
echo "  5. Start writing in drafts/draft-v1.md"
echo "  6. Review shared/style-guide.md for writing guidelines"
