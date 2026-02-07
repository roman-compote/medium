Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[2026-02-automated-research-evaluation-claude-code/metrics-log|Metrics Log]] | [[_promotion-tracker]]

# Social Media Promotion Posts: Automated Research Evaluation with Claude Code

## LinkedIn Post (1,300 chars max)

### Version 1: Story Angle

```
Most people use Claude Code to write code.

I used it to evaluate 10 technology platforms — systematically, with auditable sources, and zero hallucination tolerance.

The setup: a large organization needed to compare 10 collaborative platforms against 18 weighted criteria. Manually, this means weeks of inconsistent research where your first evaluation is thorough and your tenth is... optimistic.

Instead, I built a framework:
- An evaluation scorecard with 18 criteria (4 Critical, weighted up to 5x)
- A 197-line evaluation prompt with source integrity rules
- A candidate list that acts as a self-modifying queue
- An Obsidian dashboard for automatic comparison

The automation? A single bash loop:
for i in $(seq 1 10); do claude --print "$(cat prompt.md)"; done

Each evaluation runs in its own context. Fresh start, full attention, no bleed-over.

The result: 371 source citations. ~73,000 words. Scores from 130-221. Average: 174/280 — the framework isn't flattering anyone.

Key rule: vendor claim without third-party evidence = max score 3. Conservative scoring isn't a limitation — it's a feature.

Link in comments

#ClaudeCode #AI #Automation #ResearchMethodology #TechEvaluation
```

### Version 2: Data Angle

```
10 platforms. 18 criteria. 280 max score. 371 source citations. One bash loop.

I built an automated research evaluation framework using Claude Code + Obsidian. Here's what the numbers look like:

Framework:
- 18 evaluation criteria across Business, Architecture, Functional
- 4 Critical criteria (score <3 = disqualified)
- Weight system: Critical 5x, High 3x, Medium 2x

Automation:
- 197-line evaluation prompt (4 research phases, anti-hallucination checklist)
- Candidate list as a queue (resumable by design)
- Each evaluation in its own Claude Code context

Output:
- 10 complete evaluations, 650-980 lines each
- 371 total source citations (min 14, max 83 per evaluation)
- Scores: 130-221 out of 280
- Average: 174 — conservative scoring works

What worked: source integrity rules, context isolation, structural consistency
What didn't: context limits on large evaluations, search quality varies by product

The pattern is reusable for any domain — swap the criteria and candidates.

Article link in comments

#BuildInPublic #ClaudeCode #AI #Automation #TechEvaluation
```

**Timing:** Tuesday-Thursday, 9 AM-12 PM EST
**Tip:** Put article link in first comment (not in post body) for better algorithm reach.

---

## Twitter/X Thread (10 tweets)

```
I used a bash loop + Claude Code to evaluate 10 technology platforms against 18 weighted criteria.

Not AI-generated code. AI-generated research — with 371 auditable source citations.

Here's how the framework works:

1/10

---

The problem: evaluating 10 platforms manually means inconsistent depth.

Your first evaluation is thorough. By the tenth, you're scoring from memory.

I needed something systematic, auditable, and repeatable.

2/10

---

The framework has 5 building blocks:

1. Research scope (hypotheses, scenarios)
2. Evaluation scorecard (18 criteria, weighted)
3. Candidate list (acts as a queue)
4. Evaluation prompt (197 lines)
5. Solutions dashboard (Obsidian Dataview)

3/10

---

The scoring discipline is the key:

- Vendor claim without evidence → max score 3
- Third-party plugin only → score one level lower
- Custom dev required → max score 2
- No evidence → score 1

Conservative by design.

4/10

---

The automation is three lines of bash:

for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done

Each iteration = fresh context, full attention, no bleed-over between platforms.

5/10

---

Why separate contexts matter:

One session evaluating all 10 platforms would degrade. Later evaluations get less attention, information bleeds across products.

The loop gives each evaluation a fresh start. The candidate list is the only shared state.

6/10

---

It's also resumable.

If evaluation #7 fails, just run the loop again. Platforms #1-6 are already removed from the candidate list.

No checkpoint database. No orchestration framework. Just a file that gets shorter.

7/10

---

The output:

- 10 evaluations, 650-980 lines each
- 371 source citations (every URL actually visited)
- Scores: 130-221 out of 280
- ~73,000 words total
- Average score: 174 — not flattering anyone

8/10

---

Honest challenges:

- Context limits hit on the largest evaluation (978 lines)
- Search quality varies (83 sources vs 14 depending on product docs)
- Some criteria need hands-on testing AI can't do
- The prompt took multiple iterations to get right

9/10

---

The pattern is reusable.

Swap the criteria for databases, CI/CD tools, vendor assessments — anything.

Define the scorecard. List candidates. Write the prompt. Run the loop.

Full write-up with code examples and framework details:
[ARTICLE LINK]

10/10
```

**Timing:** Tuesday-Thursday, 10 AM-2 PM EST
**Tips:**
- Pin thread to profile for first week
- Engage with replies within first 2 hours
- Quote-tweet your own thread with a different angle after 24 hours

---

## Reddit

### r/ClaudeAI or r/ArtificialIntelligence

**Title:**
```
I used a bash loop + Claude Code to evaluate 10 platforms against 18 weighted criteria — here's the framework and honest results
```

**Text:**
```
Hey everyone,

Most Claude Code content focuses on writing code. I used it for something different: automated technology evaluation with auditable sources.

**The scenario:** Needed to evaluate 10 collaborative platforms for a large organization against 18 weighted criteria (business, architecture, functional).

**The framework (5 building blocks):**
- Research description with scope and hypotheses
- Evaluation scorecard (18 criteria, Critical/High/Medium weights, 280 max score)
- Candidate list as a self-modifying queue
- 197-line evaluation prompt with anti-hallucination rules
- Obsidian Dataview dashboard for automatic comparison

**The automation:**
```bash
for i in $(seq 1 10); do
  claude --print "$(cat evaluation_prompt.md)"
done
```

Each evaluation runs in its own context — fresh start, no bleed-over.

**Results:**
- 371 source citations across 10 evaluations
- Scores: 130-221 out of 280 (average 174)
- ~73,000 words of structured evaluation output
- Conservative scoring: vendor claim without evidence = max 3

**What worked:** Source integrity rules, context isolation, structural consistency
**What didn't:** Context limits on large evaluations, search quality varies by product documentation, some criteria need hands-on testing

The key anti-hallucination rule: "Only cite URLs you actually fetched with WebFetch." This single instruction is the difference between AI research and AI fiction.

Full article with code examples and framework details: [LINK]

Happy to answer questions about the framework or the automation pattern.
```

### r/programming

**Title:**
```
Automating technology evaluations with a bash loop and Claude Code — 10 platforms, 18 criteria, 371 auditable sources
```

**Text:**
```
Built a framework for automated technology evaluation using Claude Code + Obsidian + a simple bash loop. Each evaluation runs in its own context (fresh start per candidate), uses a markdown file as a queue for resumability, and enforces source integrity rules (every URL must be actually visited, not hallucinated).

Key technical details:
- The candidate list file is both input and state — each run pops one entry
- 197-line evaluation prompt defines 4 research phases, conservative scoring rules, and a 6-point anti-hallucination checklist
- Obsidian Dataview pulls YAML frontmatter from evaluation files for automatic comparison dashboards
- Score range: 130-221/280 across 10 evaluations with 371 total source citations

The pattern is domain-agnostic — swap the evaluation criteria and candidate list for any technology comparison.

Write-up with the actual bash command, scoring discipline rules, and anti-hallucination checklist: [LINK]
```

**Timing:** Monday-Wednesday, 9 AM-12 PM EST
**Tips:**
- Respond to ALL questions within first 6 hours
- Be humble and honest (Reddit values authenticity)
- Don't repost if no engagement — try a different subreddit instead

---

## Hacker News

**Title:**
```
I Automated 10 Technology Evaluations with Claude Code
```

**Timing:** Tuesday-Thursday, 8-10 AM EST
**Tips:**
- Respond to technical questions with framework details and code examples
- Be prepared for skepticism about AI research quality — the anti-hallucination rules are the key rebuttal
- Be humble in responses (HN values substance)

---

## Dev.to

- Cross-post full article **1 week after Medium**
- Set canonical URL to Medium article
- Tags: #claudecode #ai #automation #evaluation #obsidian
- Add Dev.to-specific intro: "Originally published on Medium. Cross-posted with additional formatting."

---

## Post-Publication Engagement

### First 24 Hours (Critical)
1. Respond to ALL comments within 1 hour
2. Thank commenters with specific responses
3. Share additional insights not in article (e.g., specific evaluation examples, prompt engineering iterations)
4. If asked about specific platforms: share anonymized score comparisons

### First Week
1. Share in relevant Slack/Discord communities (Claude Code Discord, Obsidian Discord)
2. Tag Anthropic on Twitter/LinkedIn (they may reshare Claude Code success stories)
3. Submit to Medium publications (Better Programming, Towards Data Science)

### Ongoing
1. Track which platforms drove most traffic
2. Note learnings in `promotion/post-publish-notes.md`
3. Create follow-up content from interesting questions (e.g., "How to write an anti-hallucination prompt for AI research")
