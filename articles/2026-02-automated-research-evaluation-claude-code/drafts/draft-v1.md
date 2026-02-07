# 10 Platforms, 18 Criteria, One Bash Loop: Automating Research with Claude Code

<!-- Draft v1 - 2026-02-07 -->
<!-- Target: 6-8 minutes (1,500-2,000 words) -->
<!-- This is the structure dump — get everything out, don't worry about polish -->

---

10 platforms. 18 criteria. 280 possible points. 371 source citations. One bash loop.

I needed to evaluate 10 collaborative platforms for a large organization. Not a quick "which one feels right" comparison — a structured, weighted, source-cited evaluation that could survive scrutiny from decision-makers who'd ask "where did you get that number?"

Doing this manually would mean weeks of inconsistent research. The first evaluation would be thorough. By the fifth, I'd be skimming. By the tenth, I'd be copying scores from memory. Every evaluator knows this fatigue.

So I built a framework where Claude Code does the research, scoring, and source verification — and a simple bash loop handles the orchestration. Each evaluation runs in its own context, produces a structured output with YAML frontmatter, and feeds into an Obsidian dashboard for instant comparison.

Here's the framework, the automation pattern, and the honest results — including where it broke down.

---

## The Problem

Evaluating multiple technology solutions for an organization sounds straightforward until you actually try to do it consistently. Ten candidate platforms, each needing assessment against 18 criteria across business, architecture, and functional categories.

The manual approach fails in predictable ways: inconsistent depth across evaluations, evaluator fatigue after the third platform, sources that are "I think I read this somewhere," and comparison spreadsheets that don't actually compare the same things.

What if you could define the evaluation criteria once and automate the rest — including the actual research? Not pattern-matching from training data, but real web research with verifiable sources?

That's what I built.

---

## The Framework: 5 Building Blocks

The framework has five modular building blocks. Each is a markdown file in an Obsidian vault. Together, they define what to evaluate, how to score it, what to evaluate next, how to do the evaluation, and where to see the results.

### 1. Research Description

This document defines scope, boundaries, and what you're actually testing. Mine included 6 testable hypotheses and 11 acceptance scenarios — each scenario maps to specific criteria and hypotheses.

The key is being explicit about what's NOT in scope. The more you constrain the scope upfront, the more consistent the automated output. Vague scope produces vague evaluations.

### 2. Evaluation Scorecard

Eighteen criteria across three categories:

- **Business** (3): Total Cost of Ownership, Vendor Lock-in, Time to Value
- **Architecture** (5): Deployment Model, Integration, Security, Data Model, Extensibility
- **Functional** (10): Collaborative Editing, Version Management, Commenting, Workspace Organization, Usability, Document Formats, Templates, Guest Access, Comment Visibility, Plugin Ecosystem

Each criterion has a weight: Critical (5x), High (3x), or Medium (2x). Maximum weighted score: 280 points. Four criteria are marked Critical — score below 3 on any of them and the solution is disqualified, regardless of total score.

The scoring rubrics are detailed: 1 (Insufficient) through 5 (Excellent), with specific descriptions for each level per criterion. This is what makes scoring deterministic — the AI doesn't need to "feel" the score. It matches evidence to rubrics.

### 3. Candidate List

A simple markdown table with platform names, versions, licenses, and descriptions. But it's also the state management for the entire automation.

The evaluation prompt reads the first row from this table, removes it, and evaluates that platform. When the table is empty, it outputs "ALL SOLUTIONS EVALUATED" and stops.

This is what makes the whole thing resumable. The state lives in the file.

### 4. Evaluation Prompt — The Engine

This is the core of the automation: 197 lines defining how Claude Code should conduct each evaluation.

Key sections:

**Research phases** — Four ordered phases: official sources first, then technical capabilities per criterion, then community evidence, then pricing. Minimum: 20 web searches and 10 page fetches per evaluation.

**Source integrity rules** — Only cite URLs you actually visited via WebFetch. Every factual claim needs a source. Never fabricate a URL. If information isn't found, say so explicitly.

**Scoring discipline** — Conservative by design:

```
- Feature claimed on website but no third-party evidence → max score 3
- Feature exists only via third-party plugin → score one level lower
- Feature requires custom development → score 2 max
- No evidence found → score 1 with note "unverified"
```

**Anti-hallucination checklist** — Six verification items before saving:

```
Before saving the file, verify:
- [ ] Every URL in the sources list was actually fetched with WebFetch
- [ ] Every score has a justification referencing a specific source number
- [ ] No pricing figures were invented — all are sourced or marked "not found"
- [ ] The specific product version was researched, not just the product name
- [ ] Scenarios marked "Pass" have documented evidence, not assumptions
- [ ] The total weighted score arithmetic is correct
```

The prompt doesn't tell Claude what to think — it tells Claude how to be honest about what it doesn't know.

### 5. Solutions Index

An Obsidian note with Dataview queries that auto-generate comparison tables from the YAML frontmatter in each evaluation file. Score comparison matrix, critical criteria check, acceptance scenario summary, hypothesis validation — all live, all automatic.

Zero manual data entry for comparison. Evaluate a new platform, save the file with proper frontmatter, and it appears in the dashboard.

---

## The Automation: The Ralph Loop

Here's where it comes together. The entire orchestration is a bash for-loop:

```bash
for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done
```

That's it. Three lines.

Each iteration starts a fresh Claude Code session. Claude reads the evaluation prompt, reads the candidate list, picks the first platform, removes it from the list, conducts the full research and evaluation, and saves the result to a structured markdown file.

### Why each evaluation gets its own context

Context overflow is the enemy of quality in long AI tasks. A single Claude Code session trying to evaluate all 10 platforms would degrade — the tenth evaluation would get a fraction of the attention the first one received. Information from earlier evaluations would leak into later ones. Scores would drift.

The loop pattern gives each evaluation the equivalent of starting a new conversation. Fresh context, full attention, no bleed-over between platforms.

The candidate list acts as the shared state between these isolated contexts. It's the only thing that persists across iterations.

### Why it's resumable

If evaluation #7 fails — network issue, context limit hit, API rate limit — just run the loop again. Claude reads the candidate list, finds that platforms #1 through #6 are already removed (their rows are gone), and picks up with #7.

No checkpointing logic. No database. No orchestration framework. Just a markdown file that gets shorter with each successful evaluation.

### What it produced

Each evaluation produced a 650–980 line file with:
- YAML frontmatter (all 18 scores, 11 scenario assessments, 6 hypothesis validations)
- Detailed scoring justifications with numbered source citations
- Strengths, weaknesses, and tradeoff analysis

Total output: approximately 73,000 words across 10 evaluations, with 371 source citations. Scores ranged from 130 to 221 out of 280 possible points.

The average score was 174 — the framework isn't flattering anyone.

---

## What Worked

**Conservative scoring prevents hallucination.** The explicit rules — vendor claim without third-party evidence caps at 3, no evidence means score 1 — produce results you can defend. When your average score is 174 out of 280, you know the framework isn't optimistic. It's honest.

**Source citation requirements force real research.** Twenty searches and 10 page fetches minimum per evaluation means Claude is actually reading documentation, release notes, and community reviews — not generating plausible-sounding claims from training data. The 371 total citations are each backed by a URL that was actually visited during the evaluation.

**Context isolation scales quality.** Each evaluation gets a fresh context window. The Nextcloud + Collabora evaluation — the largest at 978 lines and 83 sources — would have been impossible in a shared context. The loop pattern means quality doesn't degrade as you add more candidates.

**Structural consistency enables comparison.** Every evaluation follows the same template with the same YAML frontmatter fields. The Obsidian Dataview dashboard generates comparison tables automatically. No manual copy-pasting scores into a spreadsheet.

---

## Honest Challenges

**Context limits are real, even with isolation.** Some evaluations pushed the boundaries. The Nextcloud + Collabora evaluation hit 978 lines with 83 sources. When a single evaluation is that large, the quality of scoring in later sections may degrade as the context fills up.

**Web search quality varies by product.** Well-documented products get richer evaluations. Nextcloud produced 83 source citations. LaSuite Docs produced 14. The framework can't create documentation that doesn't exist — it can only find what's out there.

**Some criteria need hands-on testing.** Usability, real-time editing feel, actual deployment complexity — these require a human interacting with the product. AI evaluation is desk research, not product testing. The framework is designed to complement hands-on evaluation, not replace it.

**Prompt engineering takes iteration.** The 197-line evaluation prompt didn't arrive fully formed. Expect to run a few evaluations, review the output critically, and refine the prompt. The conservative scoring rules, for example, were added after early evaluations produced scores that felt too generous.

---

## Key Learnings

Five takeaways you can apply to your own evaluations:

1. **Structure your evaluation before automating it.** The scorecard with weighted criteria and detailed rubrics is what makes the AI output consistent and comparable. Without it, you get essays, not evaluations.

2. **Use the candidate list as a queue.** The self-modifying list pattern — read first entry, remove it, process it — is simple and powerful. No orchestration framework, no task queue, no database. Just a file that gets shorter.

3. **Enforce source integrity in the prompt.** "Only cite URLs you actually fetched" is the single most important anti-hallucination rule. It's the difference between research and fiction.

4. **Score conservatively by default.** It's easier to justify a cautious score with evidence than to defend an inflated one without it. When in doubt, score lower.

5. **Give each evaluation its own context.** Don't try to fit everything into one conversation. The loop pattern is the right level of automation — sophisticated enough to produce consistent results, simple enough to debug when something breaks.

> The framework is structured enough to automate but flexible enough to adapt. Change the criteria, change the candidates, change the domain — the pattern stays the same.

---

## The Result

Ten complete evaluations. Consistent format. 371 auditable source citations. A clear score differentiation — from 130 to 221 — that actually enables decision-making rather than producing a wall of "they're all fine."

The Obsidian dashboard provides instant visual comparison across all 18 criteria. No spreadsheet manipulation, no manual aggregation.

And the framework is reusable. Swap the evaluation criteria for a different domain — database technologies, CI/CD pipelines, design tools — and the pattern works the same way. Define the scorecard, list the candidates, write the evaluation prompt, run the loop.

The next step is hands-on testing of the top candidates, informed by this automated evaluation. The framework tells you where to focus — the human testing tells you what the framework can't.

---

## Try It Yourself

Think about the last time you had to evaluate multiple options for a technology decision. How consistent were your evaluations by the time you reached the last candidate?

The pattern is straightforward:

1. Define your criteria with weights and rubrics
2. List your candidates in a markdown table
3. Write an evaluation prompt with source integrity rules
4. Run the loop

What would you evaluate with this framework? I'd love to hear what domains people adapt it to.

And one honest caveat: AI evaluation is a starting point, not a final verdict. The framework excels at systematic desk research with auditable sources. It doesn't replace hands-on testing, team discussions, or the contextual judgment that comes from actually using a product. Use it to narrow the field and focus your human evaluation time where it matters most.

<!-- TODO: Finalize title — current is 76 chars, need under 70 -->
<!-- TODO: Add subtitle -->
<!-- TODO: Word count check and trim -->
<!-- TODO: Verify all metrics match insights/data.md -->
