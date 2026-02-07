#!/bin/bash
set -euo pipefail

# Medium Article Scaffolding Script
# Usage: ./scripts/new-article.sh YYYY-MM-topic-slug

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

# --- Copy and populate templates ---

# Extract date and topic from slug for template substitution
YEAR_MONTH=$(echo "$SLUG" | grep -oE '^[0-9]{4}-[0-9]{2}')
TOPIC=$(echo "$SLUG" | sed "s/^[0-9]*-[0-9]*-//")
TITLE_CASE_TOPIC=$(echo "$TOPIC" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)}1')
DATE=$(date +%Y-%m-%d)

# README
sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    -e "s/{{TOPIC}}/$TITLE_CASE_TOPIC/g" \
    -e "s/{{AUDIENCE}}/<!-- define your audience -->/g" \
    -e "s/{{DATE}}/$DATE/g" \
    "$TEMPLATES_DIR/README.md" > "$ARTICLE_DIR/README.md"

# Plan
sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/article-plan.md" > "$ARTICLE_DIR/plan.md"

# Outline
sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/article-outline.md" > "$ARTICLE_DIR/outline.md"

# Social media posts
sed -e "s/{{ARTICLE_TITLE}}/$TITLE_CASE_TOPIC/g" \
    "$TEMPLATES_DIR/social-media-posts.md" > "$ARTICLE_DIR/promotion/social-media-posts.md"

# Create placeholder files
cat > "$ARTICLE_DIR/research/sources.md" << 'EOF'
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

cat > "$ARTICLE_DIR/research/notes.md" << 'EOF'
# Research Notes

<!-- Raw research notes, quotes, statistics -->

## Key Findings

-

## Interesting Quotes

-

## Patterns Noticed

-
EOF

cat > "$ARTICLE_DIR/insights/data.md" << 'EOF'
# Article Data & Metrics

<!-- Specific numbers, stats, and examples for this article -->

## Key Metrics

-

## Timeline

-

## Notable Examples

-
EOF

cat > "$ARTICLE_DIR/drafts/draft-v1.md" << EOF
# $TITLE_CASE_TOPIC

<!-- Draft v1 - $(date +%Y-%m-%d) -->
<!-- Target: 6-8 minutes (1,500-2,000 words) -->
<!-- Refer to outline.md for structure -->

EOF

cat > "$ARTICLE_DIR/promotion/post-publish-notes.md" << 'EOF'
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
echo "  ├── README.md              # Status and links"
echo "  ├── plan.md                # Audience, angle, phases"
echo "  ├── outline.md             # Section structure"
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
echo "Next steps:"
echo "  1. Edit plan.md — define audience and angle"
echo "  2. Add sources to research/sources.md"
echo "  3. Structure outline.md with sections"
echo "  4. Start writing in drafts/draft-v1.md"
echo "  5. Review shared/style-guide.md for writing guidelines"
