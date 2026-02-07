# I Automated 10 Technology Evaluations with Claude Code and a Bash Loop

<!-- Draft v3 - 2026-02-07 -->
<!-- Tone & voice pass: first-person, 65% positive / 35% challenges, expanded to target -->

---

10 platforms. 18 criteria. 280 possible points. 371 source citations. One bash loop.

I needed to evaluate 10 collaborative platforms for a large organization — not a "which one feels right" comparison, but a structured, weighted evaluation with auditable sources. The kind where decision-makers can ask "where did you get that number?" and I can point to a specific URL.

Doing this manually would mean weeks of inconsistent research. I know myself: the first evaluation would be thorough. By the fifth, I'd be skimming product pages. By the tenth, I'd be scoring from memory and pretending I checked.

So I built a framework where Claude Code handles the research, scoring, and source verification — while a bash for-loop orchestrates the whole thing. Here's the framework, the automation, and the honest results.

---

## The Problem

Evaluating multiple technology solutions sounds straightforward until you try to do it consistently across all of them.

Ten candidate platforms. Eighteen evaluation criteria spanning business concerns (cost, vendor lock-in), architecture (security, deployment), and functional capabilities (real-time editing, version management). Eleven acceptance scenarios to test. Six hypotheses to validate.

The manual approach fails in predictable ways. Inconsistent depth — your first evaluation is rich, your last is thin. Evaluator fatigue — by platform seven, you're skimming. Unauditable sources — "I think I read this somewhere" doesn't survive scrutiny. And comparison spreadsheets where columns don't actually measure the same things.

What if I could define the criteria once, write an evaluation prompt once, and let Claude Code do the research across all 10 platforms — each in its own isolated context?

---

## The Framework: 5 Building Blocks

The whole framework is five markdown files in an Obsidian vault. No special tooling, no databases, no orchestration platforms. Just structured text.

**1. Research Description** — Scope, boundaries, hypotheses, acceptance scenarios. This is where I defined 6 testable hypotheses and 11 concrete scenarios. More importantly, it's where I defined what's NOT in scope. Turns out, constraining what you don't need is what makes automated output consistent.

**2. Evaluation Scorecard** — 18 criteria across three categories. Each criterion has a weight: Critical (5x), High (3x), or Medium (2x). Maximum: 280 weighted points. Four Critical criteria — score below 3 on any and the solution is disqualified regardless of total score. The rubrics are specific: not "good = 4" but detailed descriptions of what a 4 looks like for that particular criterion. This matters because it makes scoring deterministic. The AI matches evidence to rubrics instead of vibing a number.

**3. Candidate List** — Here's where it gets clever. It's a markdown table with platform names, versions, and descriptions. But it's also the state machine for the entire automation. The evaluation prompt reads the first row, removes it, evaluates that platform. When the table is empty, it stops. This makes the loop resumable — if something crashes at platform 7, platforms 1–6 are already gone from the list.

**4. Evaluation Prompt (197 lines)** — The engine. It defines four research phases (official sources → technical capabilities → community evidence → pricing), minimum research effort (20 web searches, 10 page fetches), source integrity rules, and conservative scoring discipline:

```
- Vendor claim without third-party evidence → max score 3
- Third-party plugin only → score one level lower
- Requires custom development → score 2 max
- No evidence found → score 1 with "unverified"
```

It ends with an anti-hallucination checklist — six items Claude must verify before saving each evaluation. Every URL must be actually fetched. Every score must reference a source. No pricing figures invented.

> The prompt doesn't tell Claude what to think — it tells Claude how to be honest about what it doesn't know.

**5. Solutions Index** — An Obsidian Dataview dashboard that auto-generates comparison tables from YAML frontmatter across all evaluation files. Score matrix, critical criteria check, scenario summary — all live. I add a new evaluation file and it appears in the dashboard automatically.

---

## The Automation: The Ralph Loop

Here's the part that makes people pause. The entire orchestration is three lines of bash:

```bash
for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done
```

Each iteration starts a fresh Claude Code session. It reads the evaluation prompt, opens the candidate list, picks the first platform, removes it from the table, conducts the full research with live web searches, scores all 18 criteria, assesses all 11 scenarios, and saves a structured evaluation file.

**Why separate contexts.** Context overflow is the enemy of quality in long AI tasks. One massive session evaluating all 10 platforms would degrade — later evaluations would get less attention, information would bleed between platforms, scores would drift. The loop gives each evaluation a fresh context with full attention. The candidate list is the only state that persists.

**Why it's resumable.** If evaluation #7 fails — network issue, API timeout, anything — I just run the loop again. Platforms #1–6 are already removed from the candidate list. Claude picks up at #7. No checkpoint database. No orchestration framework. Just a file that gets shorter with each successful run.

**What it produced.** Ten evaluation files, 650–980 lines each. YAML frontmatter with all 18 scores. Detailed justifications with numbered source citations. Scenario assessments. Hypothesis validation. Total output: approximately 73,000 words and 371 source citations. Scores ranged from 130 to 221 out of 280.

Average score: 174. The framework isn't flattering anyone.

---

## What Worked

**Conservative scoring prevents hallucination.** When vendor-only claims cap at 3 and missing evidence means 1, you get scores that survive scrutiny. An average of 174/280 means the framework is being honest, not optimistic.

**Source citation requirements force real research.** Twenty searches and 10 page fetches minimum means Claude reads actual documentation, GitHub repos, and community reviews — not training data. 371 citations, each backed by a URL that was actually visited.

**Context isolation scales.** The largest evaluation — Nextcloud + Collabora — hit 978 lines with 83 sources. In a shared context, that evaluation alone would consume most of the window. The loop ensures every evaluation gets full attention regardless of position.

**Structural consistency enables comparison.** Same template, same YAML fields, same scoring rubrics. The Dataview dashboard generates comparison tables automatically. No copy-pasting into spreadsheets.

---

## Honest Challenges

**Context limits are real.** Even with isolation, the 978-line evaluation pushed boundaries. Quality of late-section scoring may have degraded as the context filled up with research.

**Search quality varies.** Nextcloud produced 83 sources. LaSuite Docs produced 14. Well-documented products get richer evaluations. The framework can't create documentation that doesn't exist.

**Some criteria can't be researched.** Usability, real-time editing responsiveness, deployment pain — these need a human at a keyboard. AI evaluation is desk research, not product testing. It's meant to complement hands-on evaluation, not replace it.

**The prompt took iteration.** 197 lines didn't appear on day one. Conservative scoring rules were added after early evaluations came back too generous. Expect to refine.

---

## Key Learnings

1. **Structure before automating.** Weighted criteria with detailed rubrics make AI output consistent. Without them, you get essays instead of evaluations.

2. **Use the candidate list as a queue.** A self-modifying markdown file is simpler than any orchestration framework and just as effective.

3. **Enforce source integrity.** "Only cite URLs you actually fetched" is the single most important anti-hallucination rule.

4. **Score conservatively by default.** Easier to justify a cautious score with evidence than defend an inflated one without.

5. **Isolate each evaluation's context.** The loop pattern is the right level of automation — powerful enough for consistency, simple enough to debug.

> The framework is structured enough to automate but flexible enough to adapt. Change the criteria, change the candidates, change the domain — the pattern stays the same.

---

## The Result

Ten evaluations. Consistent format. 371 auditable sources. A score range — 130 to 221 — that enables real decisions instead of a wall of "they're all adequate."

The framework is reusable. Swap criteria for any evaluation domain: databases, CI/CD tools, design platforms, vendor assessments. Define the scorecard, list candidates, write the prompt, run the loop.

Next step: hands-on testing of the top 3 candidates, informed by where the automated evaluation flagged strengths and gaps.

---

## Try It Yourself

Think about your last multi-option technology evaluation. How consistent were you by the last candidate?

The pattern is four steps:
1. Define criteria with weights and rubrics
2. List candidates in a markdown table
3. Write an evaluation prompt with source integrity rules
4. Run the loop

What would you evaluate with this framework? I'm curious what domains people adapt it to — share your ideas in the comments.

One caveat: AI evaluation is a starting point, not a final verdict. Use it to narrow the field and focus your hands-on evaluation time where it matters most.
