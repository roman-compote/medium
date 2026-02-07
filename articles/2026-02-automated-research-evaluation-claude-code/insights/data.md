Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[2026-02-automated-research-evaluation-claude-code/plan|Plan]] | [[2026-02-automated-research-evaluation-claude-code/outline|Outline]]

# Automated Research Evaluation with Claude Code — Data & Metrics

---

## Executive Summary

Built an automated research evaluation framework using Obsidian + Claude Code that evaluated 10 collaborative platform technologies against 18 weighted criteria with auditable web sources. Each evaluation ran autonomously in its own Claude Code context via a bash loop ("ralph loop"), producing consistent, source-cited evaluations ready for decision-making.

**Bottom Line:**

- **Timeline:** Framework design ~2 days, all 10 evaluations automated via bash loop
- **Key metric 1:** 10 platforms evaluated against 18 criteria (280 max weighted score)
- **Key metric 2:** 371 total source citations across all evaluations (avg 37 per evaluation)
- **Key metric 3:** Score range: 130–221 out of 280 possible points
- **Outcome:** Structured, auditable comparison matrix with clear recommendation — produced by a single bash command

---

## Project Context

### What Was Built?

- **Automated research evaluation framework** — 5 modular building blocks that define scope, criteria, candidates, evaluation logic, and results aggregation
- **Evaluation prompt** (197 lines) — The automation engine defining research phases, scoring discipline, source integrity rules, and anti-hallucination checks
- **Ralph loop** — A bash for-loop that runs Claude Code once per candidate, each in its own context, using the candidate list as a queue
- **Obsidian Dataview dashboards** — Live comparison tables pulling from YAML frontmatter across all evaluation files
- **10 complete evaluations** — 645–978 lines each, 6,184–8,890 words each, with numbered source citations

### Why This Matters (Differentiators)

1. **Research automation, not code generation** — AI systematically evaluated products with evidence, not just wrote code
2. **Anti-hallucination by design** — Every URL must be actually fetched, every claim cited, conservative scoring enforced
3. **Stateless automation** — Each evaluation runs in its own context (no context overflow), candidate list acts as a queue (resumable)
4. **Structured enough to automate, flexible enough to adapt** — The 5 building blocks can be recombined for any evaluation domain

### Tech Stack / Tools Used

- **Claude Code** — CLI AI assistant with `--print` flag for non-interactive execution
- **Obsidian** — Markdown knowledge base with Dataview plugin for live dashboards
- **Bash** — Simple for-loop orchestration (the "ralph loop")
- **YAML frontmatter** — Structured metadata enabling automated comparison views
- **WebSearch + WebFetch** — Claude Code tools for live internet research during evaluation

---

## Framework Building Blocks

### Block 1: Research Description (`POC1 Collaborative Workspaces.md`)

- Defines scope, boundaries, hypotheses (6), acceptance scenarios (11)
- Establishes what's in scope and explicitly what's NOT
- Time-boxed: 1 week per platform evaluation
- Target: 50–200 users, self-hosted, EU jurisdiction

### Block 2: Evaluation Scorecard (`POC1 Evaluation scorecard.md`)

- 18 criteria across 3 categories:
  - **Business** (3 criteria): TCO, Vendor Lock-in, Time to Value
  - **Architecture** (5 criteria): Deployment, Integration, Security, Data Model, Extensibility
  - **Functional** (10 criteria): Collaborative Editing, Versioning, Commenting, Organization, Usability, Document Formats, Templates, Guest Access, Comment Visibility, Plugin Ecosystem
- Weight system: Critical (5x), High (3x), Medium (2x), Low (1x)
- **Maximum weighted score: 280 points**
- 4 Critical criteria (B01, A05, FC.01, FC.02) — score <3 = disqualified
- Scoring scale: 1 (Insufficient) to 5 (Excellent) with detailed rubrics

### Block 3: Candidate List (`POC1 Candidate Platforms List.md`)

- Markdown table with columns: #, Name, Type, License, Website, Description
- **Acts as a queue** — the evaluation prompt reads the first row, removes it, evaluates it
- When table is empty: outputs "ALL SOLUTIONS EVALUATED" and stops
- This is what makes the loop resumable — state persists in the file

### Block 4: Evaluation Prompt (`evaluation_prompt.md`, 197 lines)

The automation engine. Key sections:
- **Operational Steps** — Read candidate list → pick first → remove from list → evaluate → save
- **Research Phases** (4 phases): Official sources → Technical capabilities → Community evidence → Pricing/TCO
- **Minimum research effort** — At least 20 web searches, 10 page fetches per evaluation
- **Source Integrity Rules** — Only cite URLs actually visited, every claim needs a source, never fabricate URLs
- **Scoring Discipline** — Conservative scoring rules:
  - Vendor claim without third-party evidence → max score 3
  - Feature via third-party plugin → score one level lower
  - Feature requires custom development → max score 2
  - No evidence found → score 1 with "unverified" note
- **Anti-Hallucination Checklist** — 6-point verification before saving

### Block 5: Solutions Index (`POC1 Solutions Index.md`)

- Dataview-powered dashboard pulling from all evaluation file frontmatter
- Views: Score comparison matrix, Critical criteria check, Acceptance scenarios summary, Hypothesis validation
- Score interpretation: 230–280 Excellent, 185–229 Good, 140–184 Adequate, <140 Not recommended

---

## Evaluation Results Summary

### Score Table

| Solution | Weighted Score (/280) | Sources Cited | File Size (words) |
|---|---|---|---|
| ONLYOFFICE DocSpace 3.5 | 221 | 37 | 8,757 |
| Nextcloud Hub 30 + ONLYOFFICE Docs 9.2 | 195 | 65 | 7,762 |
| Nextcloud Hub 30 + Collabora Online 24.04 | 193 | 83 | 8,890 |
| XWiki 16.4.6 | 192 | 31 | 7,536 |
| openDesk 1.x | 175 | 37 | 7,146 |
| LaSuite Docs | 170 | 14 | 6,558 |
| Outline v1.1.0 | 162 | 33 | 6,592 |
| CryptPad 2025.9.0 | 159 | 26 | 6,184 |
| LEOS 2.1.0 | 146 | 17 | 7,046 |
| Docmost v0.25.0-beta.1 | 130 | 28 | 6,854 |

### Aggregate Metrics

| Metric | Value |
|--------|-------|
| Total evaluations | 10 |
| Total criteria per evaluation | 18 |
| Maximum weighted score | 280 |
| Acceptance scenarios per evaluation | 11 |
| Hypotheses validated | 6 |
| Total source citations (all evaluations) | 371 |
| Average sources per evaluation | 37 |
| Score range | 130–221 |
| Average score | 174 |
| Evaluation prompt length | 197 lines |
| Average evaluation length | 7,333 words |
| Total evaluation output | ~73,000 words |

---

## What Worked vs. What Didn't

### What Worked

1. **Conservative scoring prevents hallucination** — The explicit rules (vendor claim without evidence = max 3, no evidence = score 1) produce trustworthy scores that can survive scrutiny
2. **Source citation requirements** — Forcing 20+ searches and 10+ page fetches per evaluation ensures real research, not pattern completion from training data
3. **Candidate list as queue** — The self-modifying candidate list makes the entire process resumable. If the loop fails at evaluation #7, just run it again — it picks up where it left off
4. **Consistent output structure** — Every evaluation follows the exact same template with YAML frontmatter, making Dataview comparison tables work automatically
5. **Context isolation via the loop** — Each evaluation gets a fresh Claude Code context with full attention, avoiding degradation from context window limits

### What Didn't Work

1. **Context limits still matter** — Some evaluations (Nextcloud + Collabora = 978 lines, 83 sources) pushed context limits, potentially affecting late-evaluation criteria scoring
2. **Web search quality varies** — Some products have poor documentation online; LaSuite Docs only produced 14 sources vs. 83 for Nextcloud
3. **Hands-on testing can't be automated** — Several criteria (usability, real-time editing feel) need actual product interaction; AI-only evaluation has limits
4. **Prompt engineering requires iteration** — The 197-line evaluation prompt went through multiple revisions to produce consistent results

### What to Do Differently

1. Add a "research quality" meta-score to flag evaluations with low source counts
2. Consider splitting very large evaluations into sub-contexts (research phase + scoring phase)
3. Include a cross-evaluation calibration step to normalize scoring

---

## Key Numbers for the Article

**For the title / hook:**
- 10 platforms, 18 criteria, 280 possible points, one bash loop
- 371 source citations, ~73,000 words of evaluation output

**For the journey section:**
- 197-line evaluation prompt defining the automation engine
- Candidate list as a self-modifying queue — enables resume
- `for i in $(seq 1 10); do claude --print "$(cat evaluation_prompt.md)"; done`

**For the "what worked" section:**
- Conservative scoring: vendor claim without evidence = max score 3
- 20 searches + 10 page fetches minimum per evaluation
- Scores ranged from 130–221, average 174 — no artificially inflated results

**For the "honest challenges" section:**
- Source quality varies: 14 to 83 sources across evaluations
- Context limits: largest evaluation hit 978 lines
- Some criteria need hands-on testing AI can't do

**For social media posts:**
- "10 platforms. 18 criteria. 371 sources. One bash loop."
- "The evaluation prompt is 197 lines — 6 of those are an anti-hallucination checklist"

---

## Code Examples

### Example 1: The Ralph Loop (bash command)

```bash
for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done
```

### Example 2: Key section from evaluation prompt — Scoring Discipline

```markdown
## Scoring Discipline

- **Score conservatively**:
  - Feature claimed on website but no third-party evidence → max score 3
  - Feature exists only via third-party plugin → score one level lower
  - Feature requires custom development → score 2 max
  - No evidence found → score 1 with note "unverified"
- **When information is unavailable**: state "Information not found during
  research" and score 1-2. Do NOT fill gaps with assumptions.
```

### Example 3: Anti-Hallucination Checklist (from evaluation prompt)

```markdown
## Anti-Hallucination Checklist

Before saving the file, verify:
- [ ] Every URL in the sources list was actually fetched with WebFetch
- [ ] Every score has a justification referencing a specific source number
- [ ] No pricing figures were invented — all are sourced or marked "not found"
- [ ] The specific product version was researched, not just the product name
- [ ] Scenarios marked "Pass" have documented evidence, not assumptions
- [ ] The total weighted score arithmetic is correct
```

---

## Quotes / Insights for Blockquotes

> The evaluation prompt doesn't just tell Claude what to evaluate — it tells Claude how to be honest about what it doesn't know.

> The candidate list is both the input and the state. Each run pops one entry off the queue. When the table is empty, it stops. That's what makes a simple for-loop powerful enough.

> Conservative scoring isn't a limitation — it's a feature. If a vendor's own website is the only source, that's a max score of 3. You want your evaluation to survive scrutiny, not win an optimism contest.

---

**Date Generated:** 2026-02-07
**For:** Medium Article — "Automated Research Evaluation with Claude Code"
**Status:** Ready for article drafting
