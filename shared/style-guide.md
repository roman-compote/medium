# Medium Article Style Guide

Best practices distilled from analysis of successful Medium articles about AI-assisted development.

See [[article-analysis]] for the full source analysis.

**Example articles that follow this guide:**
- [[2026-01-building-saas-claude-code/index|Building a Production SaaS with Claude Code]] — Time Transformation hook, sprint-based journey, 65/35 tone balance

---

## Target Length

- **Sweet spot**: 6-8 minutes (1,500-2,000 words)
- 4-10 minutes gets highest engagement
- Beyond 10 minutes: engagement drops sharply
- Articles under 4 minutes can work if highly structured (e.g., tool reviews with pros/cons)

## Article Structure

Follow this proven narrative arc:

1. **Hook** (2-3 paragraphs, ~150 words) — Grab attention with a paradox, time transformation, or specific pain point
2. **Context / The Idea** (~150 words) — What you built and why it's not a toy project
3. **The Journey** (800-1,000 words) — Chronological or sprint-based progression with specific challenges
4. **What Worked** (3-5 bullets, ~250 words) — Concrete examples with metrics
5. **Where It Didn't / Honest Challenges** (3-4 bullets, ~200 words) — Technical, process, or philosophical problems
6. **The Real Costs** (~200 words) — Time investment, late nights, API costs
7. **Key Learnings** (5-6 bullets, ~250 words) — Actionable takeaways others can use
8. **The Result** (~150 words) — Final metrics, live product, what's next
9. **Conclusion & CTA** (100-150 words) — One-sentence summary, invitation to engage

All articles follow: **Problem -> Solution -> Results -> Learnings**

## Opening Hook Patterns

Use one or combine:

| Pattern | Example | When to Use |
|---------|---------|-------------|
| **Paradox/Irony** | "The irony wasn't lost on me..." | When your story has a twist |
| **Time Transformation** | "Four weeks ago, I had an idea. Today, it's live..." | When timeline is impressive |
| **Personal Pain Point** | "Last month, I spent 23 hours writing a single article" | When solving your own problem |
| **Honest Positioning** | "As a founder, I experiment a lot..." | When establishing credibility |
| **Scale Emphasis** | "468 commits. 695 tests. Zero production incidents." | When numbers tell the story |

## Tone & Voice

- **Balance**: 65% positive achievements / 35% honest challenges
- **Person**: First-person storytelling ("I built...", "We discovered...")
- **Register**: Conversational yet credible — not academic, not casual
- **Specificity**: Always specific, never vague ("3 library attempts over 8 hours" not "it took a while")

### Voice targets

Aim for a blend of:
- **Thoughtful Builder** — Philosophical, technical depth, nuanced
- **Honest Experimenter** — Candid, practical, verdict-driven
- **Motivational Teacher** — Encouraging, action-oriented, community-focused

## Metrics & Data

Always include specific numbers. Most effective patterns:

1. **Time transformations** — "23 hours -> 5 hours (78% reduction)"
2. **Specific counts** — "512 unit tests", "255 issues resolved"
3. **Percentage improvements** — "200% velocity increase", "60% code duplication reduced"
4. **Concrete examples** — "6 out of 10 people responded", "3 wanted Slack integration"
5. **Timeline breakdowns** — "Day 1 morning vs afternoon", "Sprint 1 vs Sprint 4"
6. **Before/after contrasts** — Show the transformation with specific numbers

Vague claims ("faster", "better", "improved") are ineffective. Quantify everything.

## Formatting

### Must-haves
- Heading hierarchy (H2 for sections, H3 for subsections)
- Bold for emphasis on key phrases
- Bullet points extensively
- Short paragraphs (2-4 sentences max)
- Numbered lists for sequences and steps

### Visuals
- 3-5 images per article (screenshots, diagrams, stock photos)
- 1-2 code snippets (only when essential, keep short)
- Pull quotes / blockquotes for key insights
- Visual breaks every 300-400 words

### Code snippets
- Use sparingly — only when they illustrate a specific point
- Keep under 10 lines
- Include syntax highlighting
- Add a one-line explanation above each snippet

## Calls to Action

End with multiple CTA types:

| Type | Example | Effectiveness |
|------|---------|---------------|
| **Comment request** | "What's your experience with AI coding tools?" | High engagement |
| **Try it yourself** | "Try Claude Code yourself — here's what I learned" | High motivation |
| **Resource links** | Link to docs, live app, code | High value |
| **Meta element** | "This article was outlined with Claude Code" | High memorability |
| **Community invitation** | "Share your story in the comments" | Builds discussion |
| **Honest caveat** | "Your mileage may vary" | Builds trust |

## Publishing Timing

- **Best days**: Tuesday, Wednesday, Thursday
- **Best times**: 7-9 AM or 12-2 PM EST
- **Avoid**: Friday afternoon, weekends (lower engagement)
- **First 24 hours matter most** — Medium algorithm prioritizes early engagement

## Challenges & Honesty Framework

Include three types of challenges:
1. **Technical problems** — Library issues, bugs, compatibility failures
2. **Process problems** — Context limits, workflow friction, testing gaps
3. **Philosophical problems** — Tradeoffs, what AI can't do, human judgment vs automation

Frame challenges constructively: problem -> attempted solution -> what you learned.

## Tags (Medium)

Choose 5 tags per article. Common effective tags:
- Claude Code, AI, Coding, Startup, SaaS
- Build in Public, Software Development, Programming
- Web Development, TypeScript, React

## Title Patterns

Effective title formulas:
- **Numbers + Honesty**: "Building X: 468 Commits, 695 Tests, Real Lessons"
- **Journey + Brackets**: "From Solo Founder to Production (What Worked & What Didn't)"
- **First Person + Promise**: "I Built X with Y — Here's the Real Story"
- Keep under 70 characters for social media previews

## Draft Versions

See [[draft-versions-guide]] for the recommended version progression:
- **v1** — Structure dump (get everything out)
- **v2** — Structure edit (fix the narrative arc)
- **v3** — Tone & voice pass (make it sound like you)
- **v4** — Final polish (publication-ready)
