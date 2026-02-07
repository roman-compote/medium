Related: [[2026-02-automated-research-evaluation-claude-code/index|Article Index]] | [[2026-02-automated-research-evaluation-claude-code/research/notes|Research Notes]] | [[article-analysis]]

# Sources & References

## Competitive Articles (What's Already Out There)

### Ralph Loop / Bash Loop + Claude Code

- [Ralph Wiggum: How to Make Claude Code Work While You Sleep](https://pasqualepillitteri.it/en/news/192/ralph-wiggum-claude-code-loop-bash-coding-agent) — Pasquale Pillitteri, Feb 2026. Covers the Ralph Wiggum autonomous coding agent bash loop technique. Focuses on **code generation** (building features while you sleep), not research/evaluation. **Gap: Nobody applies the ralph loop to structured research evaluation rather than coding tasks.**

- [Ralph Wiggum With Claude Code: How People Are Using It Effectively](https://blog.devgenius.io/ralph-wiggum-with-claude-code-how-people-are-using-it-effectively-1d03d5027285) — Dev Genius / Medium, Jan 2026. Community roundup of ralph loop usage patterns: feature branches, PR creation, Docker isolation. All examples are code-focused. **Gap: No examples of ralph loop for research, evaluation, or analysis workflows.**

- [Ralph Wiggum Approach using Claude Code](https://www.newline.co/@Dipen/ralph-wiggum-approach-using-claude-code--a7ce3ef8) — Newline, Jan 2026. Tutorial on building the bash loop with while loop, Docker isolation, and project structure. Pure coding automation. **Gap: Does not address non-coding use cases like systematic research or product evaluation.**

- [frankbria/ralph-claude-code (GitHub)](https://github.com/frankbria/ralph-claude-code) — Jan 2026. Open source implementation of the Ralph loop pattern with .ralph/ subfolder for configuration. Focused on autonomous development. **Gap: Framework is code-generation only, no research/evaluation templates.**

- Reddit: [My Ralph Wiggum breakdown just got endorsed](https://www.reddit.com/r/ClaudeAI/comments/1qlqaub/my_ralph_wiggum_breakdown_just_got_endorsed_as/) — r/ClaudeAI, Jan 2026. 70+ comments. Describes the ralph loop as "a simple bash while loop that calls Claude in headless mode, creating a fresh context for each iteration." **Gap: Every example in the thread is about code generation, not research.**

- Reddit: [The Ralph-Wiggum Loop](https://www.reddit.com/r/ClaudeCode/comments/1q9qjk4/the_ralphwiggum_loop/) — r/ClaudeCode, Jan 2026. 86 posts. Core discussion defining the pattern. **Gap: Same — coding only.**

- Reddit: [TRUST ME BRO: Most people are running Ralph Wiggum wrong](https://www.reddit.com/r/ClaudeCode/comments/1qc4vg0/trust_me_bro_most_people_are_running_ralph_wiggum/) — r/ClaudeCode, Jan 2026. 98 posts. Debate about correct implementation. **Gap: All about code quality, not research quality or anti-hallucination.**

### Claude Code Workflows (General)

- [I mastered the Claude Code workflow](https://medium.com/@ashleyha/i-mastered-the-claude-code-workflow-145d25e502cf) — Ashley Ha, Medium, ~Nov 2025. 1,600+ likes. Covers Phase 1 (Research @research_codebase.md), Phase 2 (Plan), Phase 3 (Execute). Popular workflow article. **Gap: Research phase means "read the codebase" not "evaluate products against criteria." No systematic evaluation methodology.**

- [My (Still Evolving) Workflow with Claude Code](https://dev.to/yooi/building-with-ai-my-still-evolving-workflow-with-claude-code-365b) — DEV Community, Jul 2025. Covers /init, sub-agents, code review loops. **Gap: No research or evaluation use case. Pure development workflow.**

- [AI development workflow: from Claude Code to production](https://vladimirsiedykh.com/blog/ai-development-workflow-claude-code-production-complete-guide-2025) — Vladimir Siedykh, Aug 2025. Complete guide to AI development with Claude Code from terminal to production. **Gap: End-to-end development, not research. No structured evaluation framework.**

- [CLI Agents Part 2: Claude Code Best Practices](https://vld-bc.com/blog/cli-agents-part2-claude-code-best-practices) — Volodymyr Dvernytskyi. Covers CLAUDE.md structure, child folder instructions, permissions. **Gap: Configuration best practices, not use case demonstration.**

- [Claude Code Workflow Guide](https://hackmd.io/@SebBelisle/B14OmVuXWx) — HackMD, Dec 2025. Delegation patterns, phone-initiated tasks, cloud execution. **Gap: Generic delegation, no structured research methodology.**

- Reddit: [Claude Code workflow that's been working well for me](https://www.reddit.com/r/ClaudeAI/comments/1mhgskk/claude_code_workflow_thats_been_working_well_for/) — r/ClaudeAI, ~Aug 2025. 30+ comments. Covers /research, /requirements, file-based workflow. **Gap: "Research" means codebase exploration, not product evaluation.**

### AI-Powered Research Pipelines

- Reddit: [I Built an AI-Powered Research Pipeline with Claude Agents That Turns Scientific Papers into Blog Posts](https://www.reddit.com/r/ClaudeAI/comments/1n0vsi4/i_built_an_aipowered_research_pipeline_with/) — r/ClaudeAI, ~Sep 2025. 7 comments. Uses Claude agents for academic paper summarization. **Gap: Turns papers into blog posts, not systematic multi-product evaluation. No scoring, no weighted criteria, no anti-hallucination framework.**

- [o2alexanderfedin/strategic-research-automation-template (GitHub)](https://github.com/o2alexanderfedin/strategic-research-automation-template) — Nov 2025. GitHub template for autonomous strategic research using Claude Code. **Closest competitor to our approach.** **Gap: Template-based, but focused on strategic research reports rather than structured scored evaluations with weighted criteria and candidate queuing.**

### Self-Improving / Autonomous AI Agents

- [Self-Improving Coding Agents](https://addyosmani.com/blog/self-improving-agents/) — Addy Osmani, Feb 2026. Covers loop instrumentation, timing per task, self-improvement patterns. **Gap: About coding agent loops improving code quality, not about research quality or evaluation rigor.**

### Technology Evaluation Frameworks (Non-AI)

- [Technology Evaluation Framework - Judging](https://www.sibasispadhi.com/frameworks/judging/) — Sibasis Padhi. Structured framework for scalable, secure, production-ready systems evaluation. **Gap: Manual framework, no automation. Shows the traditional approach our article replaces/augments.**

- [Compliance Technology Evaluation Frameworks 2026 Guide](https://influenceflow.io/resources/compliance-technology-evaluation-frameworks-your-2026-selection-guide/) — InfluenceFlow. Guide to compliance technology evaluation. **Gap: Industry-specific (compliance), manual process, no AI automation.**

- MIT Thesis: [Technology Evaluation Framework](https://dspace.mit.edu/bitstream/handle/1721.1/122586/1119391612-MIT.pdf) — Heslop, 2019. Academic framework for technology evaluation requiring transparency and fact-based conclusions. **Gap: Purely academic and manual. Validates the need for structured evaluation but offers no automation.**

### AI Coding Tools (General)

- [AI Coding Tools: The Complete Guide to Claude Code](https://senrecep.medium.com/ai-coding-tools-the-complete-guide-to-claude-code-opencode-modern-development-eb9da4477dc1) — Recep Sen, Medium, Jan 2026. Comprehensive guide comparing AI coding tools. **Gap: Tool comparison article, not a methodology article. Compares tools rather than teaching evaluation methodology.**

- YouTube: [Claude Code for product managers: research, writing, context](https://www.youtube.com/watch?v=oBho3hZ7MHM) — How I AI, Jan 2026. Video about using Claude Code for PM research and writing. **Gap: Video format, PM-focused, no structured scoring framework.**

- YouTube: [How to Automate Your Work with Claude Code (Beginner)](https://www.youtube.com/watch?v=oC0mPBSmzfQ) — Liam Ottley, Jan 2026. Beginner tutorial on Claude Code automation. **Gap: Beginner-level, no advanced evaluation workflow.**

## Documentation References

- [Common workflows - Claude Code Docs](https://code.claude.com/docs/en/common-workflows) — Official Anthropic documentation. Step-by-step guides for codebases, bugs, refactoring, testing. Includes sub-agents pattern.
- [Best Practices for Claude Code](https://code.claude.com/docs/en/best-practices) — Official. Mentions "Loop through tasks calling claude -p for each" and parallel sessions. This is the official foundation for the ralph loop pattern.
- [Claude Code GitHub Actions](https://code.claude.com/docs/en/github-actions) — Official. AI-powered automation in GitHub workflows. PR and issue analysis.
- [Hooks reference - Claude Code Docs](https://code.claude.com/docs/en/hooks) — Official. Hook events, matchers, handlers for lifecycle automation.
- [Obsidian Dataview plugin documentation](https://blacksmithgu.github.io/obsidian-dataview/) — Powers the dashboard and comparison views in the evaluation framework.

## Data Sources

- **Our own evaluation data** from `/Users/roman/code/ria/` — 10 completed evaluations of collaborative document editing platforms for Slovak government procurement:
  - CryptPad
  - Docmost
  - LaSuite Docs
  - LEOS
  - Nextcloud Hub 30 + Collabora Online 24.04
  - Nextcloud Hub 30 + ONLYOFFICE Docs 9.2
  - ONLYOFFICE DocSpace 3.5
  - openDesk
  - Outline
  - XWiki
- **Evaluation prompt** (`/Users/roman/code/ria/evaluation_prompt.md`) — ~200 lines defining research phases, source integrity rules, scoring discipline, and anti-hallucination checklist
- **Evaluation scorecard** (`/Users/roman/code/ria/docs/poc/poc_01/POC1 Evaluation scorecard.md`) — 18 weighted criteria with rubrics
- **Candidate list** (`/Users/roman/code/ria/docs/poc/poc_01/POC1 Candidate Platforms List.md`) — Queue-based list that gets consumed by the loop
- **Solutions index** (`/Users/roman/code/ria/docs/poc/poc_01/POC1 Solutions Index.md`) — Dataview-powered comparison dashboard
