Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[2026-02-automated-research-evaluation-claude-code/plan|Plan]] | [[style-guide]] | [[draft-versions-guide]]

# Article Outline: Automated Research Evaluation with Claude Code

**Target Length:** 6-8 minutes (1,500-2,000 words)
**Target Audience:** Developers, solutions architects, technical researchers
**Tone:** Thoughtful Builder + Honest Experimenter (65% positive / 35% challenges)

---

## Title Options

**Recommended:**
1. "10 Platforms, 18 Criteria, One Bash Loop: Automating Research with Claude Code" — Scale Emphasis + Numbers
2. "I Automated 10 Technology Evaluations with a Bash Loop and Claude Code" — First Person + Journey
3. "How I Used Claude Code to Evaluate 10 Platforms — Without Writing a Single Evaluation" — Paradox + Promise

---

## Article Structure

### 1. Hook (~150 words)

**Pattern:** Scale Emphasis

**Opening line:**
"10 platforms. 18 criteria. 280 possible points. 371 source citations. One bash loop."

**Setup:**
- I needed to evaluate 10 collaborative platforms for a large organization — systematically, consistently, and with auditable evidence
- Manual evaluation of each platform against 18 weighted criteria would take weeks and produce inconsistent results
- So I built a framework where Claude Code does the research, scoring, and source verification — while a simple bash loop handles the orchestration
- Promise: Here's the framework, the automation pattern, and the honest results — including where it broke down

---

### 2. Context — The Problem (~150 words)

- **The scenario:** Evaluating multiple technology solutions for a large organization. 10 candidate platforms, each needing assessment against 18 criteria across business, architecture, and functional categories
- **Why it's hard manually:** Inconsistent depth across evaluations, evaluator fatigue, difficult to audit sources, hard to compare apples-to-apples
- **The question:** What if you could define the evaluation criteria once and automate the rest — including the actual research?
- **Key constraint:** Each evaluation needs to research real, current information from the web — not just pattern-match from training data

---

### 3. The Framework — 5 Building Blocks (~400 words)

This is the "journey" section, adapted to methodology rather than chronological sprints.

#### Block 1: Research Description (~80 words)
- Defines scope, hypotheses (6), acceptance scenarios (11), boundaries
- Example: "What's in scope, what's explicitly NOT, time box per evaluation"
- Key insight: The more you constrain the scope upfront, the more consistent the automated output

#### Block 2: Evaluation Scorecard (~100 words)
- 18 criteria across 3 categories (Business, Architecture, Functional)
- Weight system: Critical (5x), High (3x), Medium (2x)
- Maximum 280 weighted points
- 4 Critical criteria — score below 3 = disqualified
- Include the weight reference table (condensed)
- Key insight: Detailed rubrics make scoring deterministic — the AI doesn't need to "feel" the score

#### Block 3: Candidate List (~60 words)
- Simple markdown table — but it's also the state management
- The evaluation prompt reads the first row, removes it, saves
- When the table is empty, it outputs "ALL SOLUTIONS EVALUATED" and stops
- This is what makes the whole thing resumable

#### Block 4: Evaluation Prompt — The Engine (~100 words)
- 197 lines defining: operational steps, research phases, source integrity, scoring discipline, anti-hallucination checklist
- Minimum: 20 web searches + 10 page fetches per evaluation
- Conservative scoring rules (vendor claim without evidence = max 3)
- Include the anti-hallucination checklist as a code block
- Key insight: The prompt doesn't tell Claude what to think — it tells Claude how to be honest about what it doesn't know

#### Block 5: Solutions Index (~60 words)
- Obsidian Dataview dashboard that auto-generates comparison tables from YAML frontmatter
- Score matrix, critical criteria check, scenario summary — all live
- Zero manual data entry for comparison — just open the dashboard

---

### 4. The Automation — The Ralph Loop (~400 words)

**This is the "wow" section.** Dedicated section, not buried in the framework.

#### How it works (~150 words)
- The bash command: `for i in $(seq 1 10); do claude --print "$(cat evaluation_prompt.md)"; done`
- Each iteration: Claude Code starts fresh, reads the candidate list, picks the first entry, removes it, runs the full evaluation, saves the result
- `--print` flag = non-interactive mode, output goes to terminal
- Each evaluation runs in its own context — fresh context window, full attention, no degradation

#### Why each evaluation gets its own context (~100 words)
- Context overflow is the enemy of quality in long AI tasks
- A single context trying to evaluate all 10 platforms would degrade — later evaluations get less attention
- The loop pattern gives each evaluation the equivalent of "starting a new conversation"
- The candidate list acts as the shared state between contexts

#### Why it's resumable (~80 words)
- If evaluation #7 fails (network issue, context limit, API error), just run the loop again
- It reads the candidate list — #1-6 are already removed, #7 is back at the top
- No checkpointing logic, no database, no orchestration framework — just a file that gets shorter

#### The actual output (~70 words)
- Each run produces: a 650-980 line evaluation file with YAML frontmatter, scored criteria with justifications, source citations, scenario assessments, hypothesis validation
- Total output: ~73,000 words across 10 evaluations, 371 source citations
- Scores ranged from 130 to 221 (out of 280) — no artificially inflated results

---

### 5. What Worked (~250 words)

1. **Conservative scoring prevents hallucination** — Explicit rules (vendor claim = max 3, no evidence = score 1) produce scores that survive scrutiny. Average score: 174/280 — the framework isn't flattering anyone
2. **Source citation requirements** — Forcing 20+ searches and 10+ fetches per evaluation means real research, not training data regurgitation. Total: 371 citations across 10 evaluations
3. **Context isolation** — Each evaluation gets a fresh context. The Nextcloud evaluation hit 978 lines and 83 sources — that would have been impossible in a shared context
4. **Structural consistency** — Every evaluation follows the same template with YAML frontmatter. The Dataview comparison dashboard works automatically — zero manual data aggregation

---

### 6. Honest Challenges (~200 words)

1. **Context limits are real** — Even with isolation, some evaluations pushed limits. The largest hit 978 lines — and quality of late-section scoring may have degraded
2. **Web search quality varies by product** — Well-documented products (Nextcloud: 83 sources) get richer evaluations than niche ones (LaSuite Docs: 14 sources). The framework can't create documentation that doesn't exist
3. **Some criteria need hands-on testing** — Usability, real-time editing feel, actual deployment complexity — these need a human with a keyboard. AI evaluation is research, not hands-on testing
4. **Prompt engineering takes iteration** — The 197-line evaluation prompt didn't appear on day one. Expect to run a few evaluations, review the output, and refine the prompt

---

### 7. Key Learnings (~250 words)

Actionable takeaways others can apply:

1. **Structure your evaluation before automating it** — The scorecard with weighted criteria and rubrics is what makes the AI output consistent. Without it, you get essays instead of evaluations
2. **Use the candidate list as a queue** — The self-modifying list pattern is simple and powerful. No orchestration framework needed
3. **Enforce source integrity in the prompt** — "Only cite URLs you actually fetched" is the single most important anti-hallucination rule
4. **Score conservatively by default** — It's easier to justify a low score with evidence than to defend an inflated one without it
5. **Give each evaluation its own context** — Don't try to fit everything into one conversation. The loop pattern is the right level of automation

> The framework is structured enough to automate but flexible enough to adapt. Change the criteria, change the candidates, change the domain — the pattern stays the same.

---

### 8. The Result (~150 words)

- 10 complete evaluations in consistent format
- 371 auditable source citations
- Clear score differentiation (130–221 range) enabling decision-making
- Obsidian dashboard providing instant comparison
- Framework reusable for any multi-option evaluation: tech stacks, vendors, tools, approaches
- What's next: hands-on testing of top 3 candidates informed by the automated evaluation

---

### 9. CTA (~100 words)

- **Try it yourself:** Think about what you'd evaluate — tech stacks? CI/CD tools? Databases? The framework adapts
- **Share your experience:** What would you automate with this pattern?
- **Comment prompt:** "What's the most tedious evaluation you've had to do manually?"
- **Meta element:** "This article's framework was used to evaluate 10 platforms for a real procurement decision"
- **Honest caveat:** AI evaluation is a starting point, not a final verdict — always validate critical decisions hands-on

---

## Visual Plan

### Screenshots Needed
1. Obsidian Dataview dashboard showing the score comparison matrix (Solutions Index)
2. Example evaluation file showing structured output with source citations

### Code Snippets
1. The ralph loop bash command (3 lines)
2. Scoring discipline rules from evaluation prompt (6 lines)
3. Anti-hallucination checklist (6 lines)

### Diagrams
1. Framework overview: 5 building blocks and how they connect (Research Description → Scorecard → Candidate List → Evaluation Prompt → Solutions Index)

### Preview Image
- Use `shared/assets/preview-image.html` as template
- Title: "10 Platforms. 18 Criteria. One Bash Loop."
- Stats: "371 sources | 73K words | 280 max score"
- Tagline: "Automating Research Evaluation with Claude Code"
