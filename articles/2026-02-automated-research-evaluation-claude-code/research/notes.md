Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[2026-02-automated-research-evaluation-claude-code/research/sources|Sources]] | [[article-analysis]]

# Research Notes

## Key Findings

### The Ralph Loop is Everywhere, But Only for Code
- The "Ralph Wiggum loop" (or "ralph loop") has exploded in the Claude Code community in January-February 2026
- Multiple articles, Reddit threads with 70-98 posts, GitHub repos, and tutorials all cover it
- Every single example found uses it for **code generation**: building features, creating PRs, running tests
- Anthropic's own Best Practices doc mentions "Loop through tasks calling claude -p for each" for batch operations
- **Nobody has published about using the ralph loop for research, evaluation, or analysis**

### Claude Code Workflows Are Code-Centric
- The top Claude Code workflow articles (Ashley Ha's "I mastered the Claude Code workflow" with 1,600+ likes) define "research" as reading the codebase, not evaluating products
- DEV Community, Medium, and blog posts all follow the pattern: plan -> code -> review -> test
- Even the strategic-research-automation-template on GitHub (closest competitor) produces research reports, not structured scored evaluations with weighted criteria

### Technology Evaluation Frameworks Exist But Are Manual
- MIT thesis (2019), compliance industry guides, and structured frameworks like Sibasis Padhi's all provide systematic evaluation methodology
- All of these are purely manual processes — spreadsheets, meetings, committee reviews
- Nobody has bridged the gap between structured evaluation frameworks and AI automation
- The academic world validates the need for "transparency of decision analysis and fact-based conclusions" (MIT thesis) — our framework delivers this automatically

### AI Research Pipelines Exist But Lack Rigor
- One Reddit post describes building an AI research pipeline with Claude Agents, but it turns papers into blog posts — no scoring, no weighted criteria
- The "automated research with AI" space is dominated by content marketing automation (n8n workflows pulling articles for social media posts) and SEO tools
- There is no published methodology for AI-assisted product evaluation with anti-hallucination safeguards

## Content Gap Analysis

### Primary Gap: Research Automation vs. Code Automation
- The entire Claude Code ecosystem content is about **writing code**
- Our article is about **writing research** — specifically structured, scored, auditable product evaluations
- This is a completely unoccupied content space
- The ralph loop is the shared mechanism, but the application is novel

### Secondary Gap: Anti-Hallucination by Design
- The ralph loop community discusses code quality (tests pass, features work, PRs are clean)
- Nobody discusses **research quality** — how to prevent hallucinated sources, fabricated URLs, invented pricing
- Our evaluation prompt has ~200 lines of anti-hallucination rules:
  - "Only cite URLs you actually visited using WebFetch during this session"
  - "Every factual claim must have a source"
  - "Never fabricate a URL"
  - "Feature claimed on website but no third-party evidence = max score 3"
  - Anti-hallucination checklist as final verification step
- This addresses the #1 concern people have about AI-generated research

### Tertiary Gap: Structured Evaluation with Weighted Scoring
- Technology evaluation frameworks exist in academia and industry but are manual
- AI tools can generate comparison tables but without systematic methodology
- Our framework combines both: 18 weighted criteria (4 Critical at 5x, 8 High at 3x, 6 Medium at 2x), scoring rubrics, acceptance scenarios, hypothesis validation
- The candidate list file acts as a queue — a simple but elegant automation detail

### The "But Can You Trust AI Research?" Question
- Every article about AI coding mentions that you should review the output
- For research, the stakes are higher — a fabricated source in a government procurement evaluation could be a serious problem
- Our framework addresses this head-on with source integrity rules and conservative scoring
- This makes the article relevant beyond the Claude Code community — procurement professionals, analysts, consultants all face this challenge

## Patterns Noticed

### What Gets Engagement in Claude Code Content
- Ashley Ha's workflow article: 1,600+ likes — practical, step-by-step, phased approach
- Ralph loop Reddit threads: 70-98 comments — people love actionable automation patterns
- "I built X with Claude Code" format performs well on both Medium and Reddit
- **Numbers drive clicks**: "10 platforms, 18 criteria, 280 weighted score" is the kind of specificity readers crave

### Common Angles in Existing Articles
1. **"I mastered X"** — personal journey, what I learned
2. **"How to automate Y"** — tutorial/how-to format
3. **"Best practices for Z"** — listicle of tips
4. **"Ralph Wiggum explained"** — the technique itself as the story
- Our angle is different: **"Here's a novel application of a known technique to a completely different domain"**
- This positions the article as: "You already know the ralph loop for coding. Here's how to use it for research."

### What Resonates with Readers
- **Specific numbers** over vague claims ("10 platforms" not "several products")
- **Reusable frameworks** they can adapt ("5 modular building blocks")
- **Proof it actually works** (10 completed evaluations, not a demo)
- **Honest limitations** (AI doesn't replace judgment, conservative scoring is intentional)
- **The "aha moment"** — readers should think "I could use this for [my evaluation problem]"

### Content Format That Works
- Medium articles in the 6-8 minute range (1,500-2,000 words)
- Code snippets showing the actual bash loop and evaluation prompt structure
- Before/after comparison (manual evaluation process vs. automated framework)
- Clear section headers for skimmability
- Real examples from the actual evaluations (anonymized if needed)

## Unique Selling Points for Our Article

1. **First article applying the ralph loop to research/evaluation** — unoccupied content space
2. **Anti-hallucination framework** — addresses the #1 concern about AI research
3. **Real production use** — 10 completed evaluations for an actual government procurement, not a demo
4. **Reusable methodology** — 5 modular building blocks anyone can adapt
5. **Bridges two worlds** — Claude Code developers + technology evaluation professionals
6. **Government procurement context** — adds credibility and stakes ("accuracy is non-negotiable")

## Questions to Address in the Article

- Why use a fresh Claude Code context for each evaluation? (Answer: prevents cross-contamination of product knowledge, avoids context window limits)
- Why not just use ChatGPT or Claude chat? (Answer: file system access for reading scorecards and writing structured output, WebSearch/WebFetch for live research, bash loop for automation)
- How reliable is the scoring? (Answer: conservative by design — vendor claims without third-party evidence max out at 3/5, unverified features score 1-2)
- Can this methodology be adapted? (Answer: yes, the 5 building blocks are domain-agnostic — swap the criteria and candidates)

## Potential Objections to Preempt

- "AI can't do real research" — counter with the source integrity rules and 20+ sources per evaluation
- "Scores are subjective" — counter with the explicit rubrics and conservative defaults
- "This only works for Claude Code" — counter with the principle being tool-agnostic (structured prompt + loop + file system)
- "Why not just use a spreadsheet?" — counter with the scale argument (10 evaluations with 20+ sources each would take weeks manually)
