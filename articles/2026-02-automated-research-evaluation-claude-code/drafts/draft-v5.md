# I Automated Technology Evaluations with Claude Code

*How a bash loop, Obsidian and structured prompts produced 371 auditable citations across 10 evaluations*

---

10 platforms. 18 criteria. 280 possible points. 371 source citations. One bash loop.

I needed to evaluate 10 collaborative document platforms for a large organization — not a "which one feels right" comparison, but a structured, weighted evaluation with auditable sources. The kind where decision-makers can ask "where did you get that number?" and I can point to a specific URL.

Doing this manually would mean weeks of inconsistent research. I know myself: the first evaluation would be thorough. By the fifth, I'd be skimming product pages. By the tenth, I'd be scoring from memory and pretending I checked.

So I built a framework where Claude Code handles the research, scoring, and source verification — while a bash for-loop orchestrates the whole thing. Here's the framework, the automation, and the results.

---

## The Problem

Evaluating multiple technology solutions sounds straightforward until you try to do it consistently across all of them.

Ten candidate platforms. Eighteen evaluation criteria spanning business concerns (cost, vendor lock-in), architecture (security, deployment model), and functional capabilities (real-time editing, version management, commenting). Eleven acceptance scenarios to test against each. Six hypotheses to validate.

The manual approach fails in predictable ways. Inconsistent depth — your first evaluation is rich, detailed, well-sourced. Your last is thin, rushed, full of assumptions. Evaluator fatigue — by platform seven, you're skimming documentation instead of reading it. Unauditable sources — "I think I read this somewhere" doesn't survive scrutiny when leadership asks pointed questions about your recommendation.

And the comparison problem: even if each evaluation is good individually, they rarely measure the same things in the same way. Your spreadsheet has columns, but the data behind those columns came from different levels of effort.

What if I could define the criteria once, write an evaluation prompt once, and let Claude Code do the research across all 10 platforms — each in its own isolated context?

---

## The Framework: 5 Building Blocks

The whole framework is five markdown files in an Obsidian vault. No databases, no orchestration platforms. Just structured text.

**1. Research Description** — Scope, boundaries, hypotheses, acceptance scenarios. I defined 6 testable hypotheses and 11 concrete scenarios. More importantly, I defined what's NOT in scope. Constraining what you don't need is what makes automated output consistent.

**2. Evaluation Scorecard** — 18 criteria across three categories. Each criterion has a weight: Critical (5x), High (3x), or Medium (2x). Maximum: 280 weighted points. Four Critical criteria — score below 3 on any and the solution is disqualified. The rubrics describe what each score level looks like for each criterion. This makes scoring deterministic — the AI matches evidence to rubrics instead of vibing a number.

**3. Candidate List** — A markdown table that doubles as state management. The evaluation prompt reads the first row, removes it, evaluates that platform. When the table is empty, it stops. This makes the loop resumable — if something crashes at platform 7, platforms 1-6 are already gone from the list.

**4. Evaluation Prompt (197 lines)** — The engine. Four research phases (official sources, technical capabilities, community evidence, pricing), minimum research effort (20 web searches, 10 page fetches), source integrity rules, and conservative scoring:

```
- Vendor claim without third-party evidence → max score 3
- Third-party plugin only → score one level lower
- Requires custom development → score 2 max
- No evidence found → score 1 with "unverified"
```

It ends with an anti-hallucination checklist: every URL must be actually fetched, every score must reference a source, no pricing figures invented.

> The prompt doesn't tell Claude what to think — it tells Claude how to be honest about what it doesn't know.

**5. Solutions Index** — An Obsidian Dataview dashboard that auto-generates comparison tables from YAML frontmatter. Score matrix, critical criteria check, scenario summary — all live. Add an evaluation file and it appears automatically.

---

## The Automation: The Loop

The Claude Code community calls this pattern the "Ralph loop" — after The Simpsons' Ralph Wiggum, who just keeps going. Here's the part that makes people pause. The entire orchestration is six lines:

```bash
while :; do
  claude -p --dangerously-skip-permissions < evaluation_prompt.md 2>&1 |
    tee /tmp/claude_eval_output.txt
  grep -q "ALL SOLUTIONS EVALUATED" /tmp/claude_eval_output.txt &&
    echo "Done — all solutions evaluated." && break
done
```

The `--dangerously-skip-permissions` flag allows Claude Code to write files and execute web searches without prompting for approval on each action — necessary for unattended evaluation runs.

Each iteration starts a fresh Claude Code session. It reads the candidate list, picks the first platform, removes it, conducts full research with live web searches, scores all 18 criteria, assesses all 11 scenarios, and saves a structured evaluation file.

**Why separate contexts.** Context overflow kills quality in long AI tasks. One session evaluating all 10 platforms would degrade — later evaluations get less attention, information bleeds between platforms, scores drift. The loop gives each evaluation a fresh context with full attention. The candidate list is the only state that persists.

**Why it's resumable.** If evaluation #7 fails, run the loop again. Platforms #1-6 are already removed. Claude picks up at #7. No checkpoint database, no orchestration framework — just a file that gets shorter.

**What it produced.** Ten evaluation files, 650-980 lines each. Each file includes YAML frontmatter with all 18 scores, detailed criterion-by-criterion justifications with numbered source citations, 11 scenario assessments, and 6 hypothesis validations. Total across all evaluations: approximately 73,000 words and 371 source citations. Scores ranged from 130 to 221 out of 280 possible points. Average: 174 — the framework isn't flattering anyone.

---

## What Worked

**Conservative scoring prevents hallucination.** When vendor-only claims cap at 3 and missing evidence means 1, you get scores that survive scrutiny. An average of 174/280 means the framework is being honest, not optimistic.

**Source citations force real research.** 20+ searches and 10+ fetches minimum means Claude reads actual documentation, GitHub repos, and community reviews. 371 citations, each backed by a URL that was actually visited.

**Context isolation scales.** The largest evaluation hit 978 lines with 83 sources. In a shared context, that single evaluation would consume most of the window. The loop ensures every evaluation gets full attention.

**Structural consistency enables comparison.** Same template, same YAML fields, same rubrics. The Dataview dashboard generates comparison tables automatically — no spreadsheet work.

---

## The Real Costs

**Framework development: ~8 hours across one week.** The 197-line evaluation prompt didn't write itself. I iterated through several versions — early evaluations came back too generous, so I added conservative scoring rules. The anti-hallucination checklist was refined after catching sourcing issues. The scorecard, candidate list, and Obsidian dashboard added another couple of hours.

**Automated evaluation: ~15 minutes per platform.** Each loop iteration — web searches, page fetches, scoring, writing the evaluation file — took about 15 minutes. Ten platforms: roughly 2.5 hours of automated runtime. API cost runs about $2 per evaluation; I ran evaluation mostly on a subscription plan (accidentally the first run was via API).

**Total: ~8 hours of human effort for 10 complete evaluations with 371 source citations.**

**The manual alternative: 1-2 weeks.** Thoroughly evaluating one platform against 18 weighted criteria with source citations — reading official docs, checking third-party reviews, writing up scored justifications — realistically takes a full day. Ten platforms at that pace means 1-2 weeks, and you'd still have the consistency problem. I'd probably have evaluated fewer platforms and made do with less evidence.

---

## Challenges

**Context limits are real.** Even isolated, the 978-line evaluation pushed boundaries. Quality of late-section scoring may have degraded as the context filled.

**Search quality varies.** The best-documented platform produced 83 sources. The least-documented produced just 14. The framework can't create documentation that doesn't exist.

**Some criteria can't be researched from documentation.** Usability, deployment pain, real-time editing responsiveness — these need a human at a keyboard. AI evaluation is desk research, not product testing. It's designed to complement hands-on evaluation, not replace it.

**The prompt took iteration.** The 197-line evaluation prompt didn't appear on day one. Conservative scoring rules were added after early evaluations came back too generous. The anti-hallucination checklist was refined after catching sourcing issues. Expect to run a few evaluations, review the output critically, and tighten the prompt.

---

## Key Learnings

1. **Structure before automating.** Weighted criteria with detailed rubrics make AI output consistent. Without them, you get essays instead of evaluations.

2. **Use the candidate list as a queue.** A self-modifying markdown file is simpler than any orchestration framework and just as effective.

3. **Enforce source integrity.** "Only cite URLs you actually fetched" is the single most important anti-hallucination rule.

4. **Score conservatively.** Easier to justify a cautious score with evidence than defend an inflated one without.

5. **Isolate each context.** The loop pattern is the right level of automation — powerful enough for consistency, simple enough to debug.

---

## The Result

Ten evaluations in a consistent format. 371 auditable source citations. A score range of 130 to 221 that creates clear differentiation — not a wall of "they're all adequate" but a ranked comparison with documented evidence for every score.

The Obsidian dashboard provides instant visual comparison across all 18 criteria. No spreadsheet manipulation, no manual data aggregation. Open the Solutions Index and the comparison tables are already there.

The framework is reusable. Swap the criteria for any domain — databases, CI/CD tools, vendor assessments, design platforms. Define the scorecard, list the candidates, write the evaluation prompt, run the loop. The pattern stays the same.

Next: hands-on testing of the top 3 candidates, focused specifically on the criteria where the automated evaluation flagged gaps or couldn't verify claims.

---

## Try It Yourself

Think about your last multi-option technology evaluation. How consistent were you by the last candidate?

1. Define criteria with weights and rubrics
2. List candidates in a markdown table
3. Write an evaluation prompt with source integrity rules
4. Run the loop

What would you evaluate with this framework? Share your ideas in the comments.

One caveat: AI evaluation is a starting point, not a final verdict. Use it to narrow the field and focus your hands-on time where it matters most.
