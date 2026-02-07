# I Automated 10 Technology Evaluations with Claude Code and a Bash Loop

<!-- Draft v2 - 2026-02-07 -->
<!-- Structure edit: tightened narrative, cut to target word count -->

---

10 platforms. 18 criteria. 280 possible points. 371 source citations. One bash loop.

I needed to evaluate 10 collaborative platforms for a large organization — not a "which one feels right" comparison, but a structured, weighted evaluation with auditable sources that could survive scrutiny.

Doing this manually would mean weeks of inconsistent research. The first evaluation would be thorough. By the fifth, I'd be skimming. By the tenth, I'd be copying scores from memory.

So I built a framework where Claude Code handles the research, scoring, and source verification — while a bash loop orchestrates the whole thing. Here's the framework, the automation pattern, and the honest results.

---

## The Problem

Evaluating multiple technology solutions sounds straightforward until you try to do it consistently. Ten platforms, each assessed against 18 criteria across business, architecture, and functional categories.

The manual approach fails predictably: inconsistent depth, evaluator fatigue, "I think I read this somewhere" sourcing, and comparison spreadsheets that don't actually compare the same things.

What if you could define the criteria once and automate the rest — including the actual web research?

---

## The Framework: 5 Building Blocks

Five markdown files in an Obsidian vault. Together, they define what to evaluate, how to score, what to evaluate next, how to run the evaluation, and where to see results.

**1. Research Description** — Defines scope, boundaries, hypotheses (6), and acceptance scenarios (11). The key: being explicit about what's NOT in scope. Vague scope produces vague evaluations.

**2. Evaluation Scorecard** — 18 criteria across three categories (Business, Architecture, Functional). Each criterion has a weight: Critical (5x), High (3x), or Medium (2x). Maximum: 280 weighted points. Four Critical criteria — score below 3 on any and the solution is disqualified.

The rubrics are detailed: 1 (Insufficient) through 5 (Excellent) with specific descriptions per criterion. This makes scoring deterministic — the AI matches evidence to rubrics instead of guessing.

**3. Candidate List** — A markdown table doubling as state management. The evaluation prompt reads the first row, removes it, evaluates that platform. When the table is empty: "ALL SOLUTIONS EVALUATED." This makes everything resumable.

**4. Evaluation Prompt (197 lines)** — The automation engine. Key components:

- *Research phases*: Official sources → technical capabilities → community evidence → pricing. Minimum: 20 web searches, 10 page fetches per evaluation.
- *Source integrity*: Only cite URLs actually visited. Every claim needs a source. Never fabricate.
- *Conservative scoring*:

```
- Vendor claim without third-party evidence → max score 3
- Third-party plugin only → score one level lower
- Requires custom development → score 2 max
- No evidence found → score 1 with "unverified"
```

- *Anti-hallucination checklist* — six items verified before saving:

```
- [ ] Every URL was actually fetched with WebFetch
- [ ] Every score references a specific source number
- [ ] No pricing figures invented
- [ ] Specific product version researched, not just product name
- [ ] "Pass" scenarios have documented evidence
- [ ] Weighted score arithmetic is correct
```

> The prompt doesn't tell Claude what to think — it tells Claude how to be honest about what it doesn't know.

**5. Solutions Index** — Obsidian Dataview dashboard auto-generating comparison tables from YAML frontmatter. Score matrix, critical criteria check, scenario summary — all live, zero manual data entry.

---

## The Automation: The Ralph Loop

The entire orchestration:

```bash
for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done
```

Three lines. Each iteration starts a fresh Claude Code session — reads the candidate list, picks the first platform, removes it, runs the full evaluation, saves the result.

**Why separate contexts matter.** Context overflow kills quality in long AI tasks. One session evaluating all 10 platforms would degrade — later evaluations get less attention, scores drift, information bleeds between platforms. The loop gives each evaluation a fresh start. The candidate list is the only shared state.

**Why it's resumable.** If evaluation #7 fails, run the loop again. Platforms #1–6 are already removed from the list. It picks up at #7. No checkpointing, no database — just a file that gets shorter.

**What it produced.** Each evaluation: 650–980 lines, YAML frontmatter with all 18 scores, detailed justifications with source citations, scenario assessments, hypothesis validation. Total: ~73,000 words, 371 source citations. Scores: 130–221 out of 280. Average: 174 — the framework isn't flattering anyone.

---

## What Worked

**Conservative scoring prevents hallucination.** Vendor claim without third-party evidence caps at 3. No evidence means 1. Average score: 174/280. These are scores you can defend.

**Source citation requirements force real research.** 20+ searches and 10+ fetches per evaluation means Claude reads actual documentation and reviews — not training data. 371 citations, each backed by a visited URL.

**Context isolation scales quality.** The Nextcloud + Collabora evaluation hit 978 lines and 83 sources. That's impossible in a shared context. The loop ensures every evaluation gets full attention.

**Structural consistency enables comparison.** Same template, same YAML fields. The Dataview dashboard generates comparison tables automatically — no spreadsheet work.

---

## Honest Challenges

**Context limits are real.** Even isolated, some evaluations pushed boundaries. At 978 lines, late-section scoring quality may degrade.

**Search quality varies by product.** Nextcloud: 83 sources. LaSuite Docs: 14. The framework can't create documentation that doesn't exist.

**Some criteria need hands-on testing.** Usability and deployment complexity require a human with a keyboard. AI evaluation is desk research, not product testing.

**Prompt engineering takes iteration.** The 197-line prompt evolved over multiple runs. Conservative scoring rules were added after early evaluations scored too generously.

---

## Key Learnings

1. **Structure before automating.** Weighted criteria with rubrics make AI output consistent. Without them, you get essays instead of evaluations.

2. **Use the candidate list as a queue.** Self-modifying file, no orchestration framework needed. Simple and powerful.

3. **Enforce source integrity.** "Only cite URLs you actually fetched" — the most important anti-hallucination rule.

4. **Score conservatively.** Easier to justify a cautious score with evidence than defend an inflated one without.

5. **Isolate contexts.** Don't fit everything into one conversation. The loop is the right level of automation.

> The framework is structured enough to automate but flexible enough to adapt. Change the criteria, change the candidates, change the domain — the pattern stays the same.

---

## The Result

Ten evaluations. Consistent format. 371 auditable sources. Score differentiation from 130 to 221 that enables real decisions — not a wall of "they're all fine."

The framework is reusable. Swap criteria for any domain — databases, CI/CD tools, design platforms. Define the scorecard, list candidates, write the prompt, run the loop.

Next: hands-on testing of the top candidates, informed by the automated evaluation. The framework tells you where to focus. Human testing tells you what it can't.

---

## Try It Yourself

Think about your last multi-option technology evaluation. How consistent were you by the last candidate?

1. Define criteria with weights and rubrics
2. List candidates in a markdown table
3. Write an evaluation prompt with source integrity rules
4. Run the loop

What would you evaluate? I'd love to hear what domains people adapt this to.

One caveat: AI evaluation is a starting point, not a final verdict. Use it to narrow the field and focus your human evaluation time where it matters most.
