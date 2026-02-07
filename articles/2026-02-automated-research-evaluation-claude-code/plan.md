Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[style-guide]] | [[article-analysis]]

# Article Plan: Automated Research Evaluation with Claude Code

## Objective

Teach developers and technical researchers how to build a reusable, automated research evaluation framework using Obsidian + Claude Code — where a single bash loop evaluates 10 technology solutions against 18 weighted criteria with auditable sources, zero hallucination tolerance, and consistent scoring.

## Target Audience

- **Developers** who use Claude Code and want to go beyond "AI wrote my code" into systematic AI-assisted research
- **Solutions architects / CTOs** who need to evaluate multiple technology options and want a structured, repeatable methodology
- **Technical researchers** who conduct product evaluations, competitive analysis, or procurement assessments and need consistency at scale

### What they already know
- Familiar with CLI tools, bash scripting, markdown
- Aware of AI coding assistants but may not have used them for research
- Understand the pain of inconsistent technology evaluations

### What they're looking for
- A concrete, reusable methodology they can adapt
- Proof that AI-assisted research can be rigorous (not just "ask ChatGPT")
- Practical automation techniques that save real time

## Unique Angle / Differentiators

**What makes this story unique:**

1. **Not "AI wrote my code"** — it's "AI systematically evaluated 10 products against 18 weighted criteria with auditable evidence." This is research automation, not code generation.
2. **The ralph loop pattern** — Each evaluation runs in its own Claude Code context via a bash loop. Stateful, resumable, no context overflow. This is the technical innovation readers can immediately replicate.
3. **Anti-hallucination by design** — The evaluation prompt enforces source integrity rules, conservative scoring, and a verification checklist. Every URL must be actually fetched, every claim must have a citation. This addresses the #1 concern about AI-generated research.
4. **Structured enough to automate, flexible enough to adapt** — The framework has 5 modular building blocks (research description, scorecard, candidate list, evaluation prompt, solutions index) that can be adapted to any evaluation domain.
5. **Real, auditable results** — 10 complete evaluations, 20+ sources each, conservative scoring, Obsidian Dataview dashboards for live comparison. Not a demo — a production evaluation that informed a real decision.

**This story is NOT:**

- A tutorial on setting up Claude Code (readers should already have it)
- A review of the specific platforms evaluated (the methodology is the story, not the results)
- A claim that AI replaces human judgment (the framework augments decision-making, it doesn't automate the decision)

## Key Data Points to Include

- 10 platforms evaluated against 18 weighted criteria
- 280 maximum weighted score (4 Critical at 5x, 8 High at 3x, 6 Medium at 2x)
- 11 acceptance scenarios tested per solution
- 6 hypotheses validated
- 20+ web sources required per evaluation (minimum: 20 searches, 10 page fetches)
- ~200 lines in the evaluation prompt defining scoring discipline and anti-hallucination rules
- Evaluation prompt enforces conservative scoring: vendor claim without third-party evidence = max score 3
- The candidate list file acts as a queue — each run pops one entry, enabling automatic resumption
- Single bash command: `for i in $(seq 1 10); do claude --print "$(cat evaluation_prompt.md)"; done`

## Title Options (Brainstorm)

1. **"10 Platforms, 18 Criteria, One Bash Loop: Automating Research with Claude Code"** — Numbers + Scale Emphasis
2. **"I Automated 10 Technology Evaluations with a Bash Loop and Claude Code"** — First Person + Journey
3. **"How to Build an Automated Research Evaluation Framework with Claude Code"** — How-to + Promise

## Phases

### Phase 1: Research
- [x] Extract framework structure from `/Users/roman/code/ria/`
- [ ] Search for similar articles about AI-assisted research evaluation
- [ ] Identify gaps in existing content

### Phase 2: Data Gathering
- [ ] Extract all metrics from evaluation files (scores, source counts, file sizes)
- [ ] Document the ralph loop mechanics
- [ ] Collect specific examples from evaluations

### Phase 3: Outline
- [ ] Define section structure following style guide arc
- [ ] Plan the framework → automation → results narrative flow
- [ ] Identify code snippets to include

### Phase 4: Draft
- [ ] Write v1 (structure dump)
- [ ] Write v2 (structure edit, cut to 1,500-2,000 words)
- [ ] Write v3 (tone & voice pass)
- [ ] Write v4 (final polish)

### Phase 5: Refine
- [ ] Verify all metrics against source data
- [ ] Finalize title and subtitle
- [ ] Review against style guide

### Phase 6: Publish & Promote
- [ ] Format for Medium
- [ ] Follow publishing checklist
- [ ] Prepare social media posts
- [ ] Publish and promote

## Success Metrics

- Views: 2,000+ (higher target due to developer + researcher audience overlap)
- Claps: 75+
- Comments: 15+ meaningful discussions (people sharing their own evaluation approaches)
- Saves: 50+ (methodology articles get saved for reference)
- Social shares: LinkedIn and Twitter engagement from both dev and research communities
