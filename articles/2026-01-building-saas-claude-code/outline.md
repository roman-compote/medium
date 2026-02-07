# Medium Article Outline: Building MABOA with Claude Code

Related: [[2026-01-building-saas-claude-code/index|Article Index]] | [[2026-01-building-saas-claude-code/plan|Plan]] | [[style-guide]] | [[draft-versions-guide]]

**Target Length:** 6-8 minutes (1,500-2,000 words)
**Target Audience:** Developers, technical founders, AI-curious engineers
**Tone:** Thoughtful Builder + Honest Experimenter (balanced, 65% positive / 35% challenges)

---

## Title Options

**Recommended:**

1. "Building a Production SaaS with Claude Code: 468 Commits, 695 Tests, Real Lessons"
2. "From Solo Founder to Production: 4 Weeks with Claude Code (What Worked & What Didn't)"
3. "I Built an AI Advisory Board with Claude Code - Here's the Real Story"

**Alternative:** 4. "Beyond the Weekend MVP: Building MABOA with Claude Code" 5. "Claude Code in the Trenches: 4 Sprints, 468 Commits, 1 Production SaaS"

---

## Article Structure

### 1. Hook (2-3 paragraphs, ~150 words)

**Opening Line:**
"Four weeks ago, I had an idea: build an AI advisory board where multiple AI experts could debate each other. Today, it's live at boailoop.vercel.app with 695 automated tests, zero production incidents, and users getting simultaneous advice from 3-5 AI advisors."

**Setup:**

- Solo founder with ambitious idea (not a toy project)
- Multi-AI orchestration (technical complexity)
- Claude Code as development partner
- Promise: Real numbers, honest challenges, actual learnings

**Hook Elements:**

- Time transformation: 4 weeks → production SaaS
- Scale: 468 commits, 114 TypeScript files, 24 API endpoints
- Quality: 695 tests (96.8% pass rate), zero incidents
- Honesty promise: "What worked vs. what didn't"

---

### 2. The Idea (2-3 paragraphs, ~150 words)

**What is MABOA?**

- Multi-AI advisory board platform
- 3-5 specialized AI advisors respond simultaneously
- Persistent advisory sessions ("loops")
- Document integration, debate mode, decision tracking

**Why This is Not a Weekend MVP:**

- Multi-persona orchestration (sequential LLM calls)
- Server-Sent Events (SSE) streaming
- Row Level Security on 7 database tables
- Comprehensive testing (3 tiers)
- CI/CD pipeline with ephemeral databases
- PDF processing in serverless

**Tech Stack (bullet list):**

- Next.js 14, TypeScript, Tailwind + shadcn/ui
- Supabase (PostgreSQL + Auth), Anthropic Claude API
- Vitest, Playwright, GitHub Actions, Vercel
- Axiom (production monitoring)

---

### 3. The Journey: 4 Sprints in 4 Weeks (800-1,000 words)

#### Sprint 1: Foundation (5 days) - 200 words

**What Was Built:**

- Database schema (7 tables, RLS policies)
- Persona CRUD API (5 endpoints)
- Board configuration
- **132 tests from day one** (this is the headline)

**Key Metric Highlights:**

- 29 commits, +17,609 lines
- 132 tests (59 unit + 62 integration + 11 E2E)
- 100% API endpoint coverage

**Claude Code Contribution:**

- Database schema generation (saved days)
- API endpoint scaffolding (REST patterns)
- Test suite setup (Vitest + Playwright)

**First Challenge:**

- Test authentication with local Supabase
- **Solution:** JWT generation, isolated test users

**Insight:**

> "Testing from day one was the best decision. Those 132 tests prevented countless regressions as the codebase evolved."

---

#### Sprint 2: Multi-Advisor Loops (7 days) - 250 words

**The Core Differentiator:**

- Multi-persona orchestration with SSE streaming
- Real-time advisor responses
- Loop history with search/filtering

**Key Metrics:**

- 81 commits, +1,537 lines
- 191 total tests (+45% growth)
- 15 issues closed

**Claude Code Shined:**

- LoopService with async generator pattern for streaming
- SSE API endpoints (dual-mode: streaming + JSON batch)
- GitHub Actions CI/CD workflow

**Mid-Sprint Pivot:**

> "We recognized test coverage was too low (23%). Mid-sprint, we pivoted from velocity to quality, adding 59 new unit tests and deferring the feedback system."

**Challenge: SQL Injection Discovered**

- Loop search vulnerable to ILIKE wildcard injection
- **Claude Code detected it and suggested escapeILIKE() utility**
- Fixed before production deployment

**Strategic Decision:**

- Quality > velocity
- Deferred features to improve testing
- Set up comprehensive CI/CD pipeline

**Metric:**

- Test coverage: 23% → 31% in one week

---

#### Sprint 3: Polish & Dashboard (7 days) - 250 words

**Exceptional Velocity:**

- 26 issues completed (200% of planned work!)
- 129 commits, 28 PRs merged
- Zero production incidents

**Key Features:**

- Dashboard overview widget
- Per-loop board configuration (custom advisors per session)
- Feedback system (upvote/downvote)
- Loop export (PDF + Markdown)
- RAG preview (markdown document upload)

**Testing Excellence:**

- Unit tests grew 189% (118 → 341)
- Complete E2E test refactoring
- data-testid attributes, helper functions
- Code duplication reduced by 60%

**Claude Code Contribution:**

- Dashboard widget components (reusable patterns)
- Export functionality (jsPDF + Markdown generation)
- E2E test refactoring (comprehensive overhaul)

**Challenge: E2E Test Brittleness**

- 14 tests failing due to CSS selectors
- **Solution:** Replaced with data-testid, helper functions
- **Result:** 100% reliability, re-enabled in CI

**Highlight:**

> "Claude Code suggested the data-testid pattern and generated helper functions that eliminated 60% of test code duplication. This was a game-changer for E2E stability."

**Metrics:**

- 441 total tests (+131% from Sprint 2)
- 28 successful deployments, zero downtime

---

#### Sprint 4: MVP Feature Complete (8 days) - 300 words

**Strategic Pivot (Customer-Driven):**

**Deprioritized:**

- Advanced document management UI
- Parallel LLM execution
- API versioning

**Prioritized Instead:**

- Axiom logging (production visibility)
- Streaming UX improvements (layout stability)
- 5-turn rate limiting (cost control)

**Why?**

> "We jointly decided with the customer that monitoring, UX polish, and cost controls were more valuable for MVP than parallel execution or API versioning. Better to launch with confidence than launch with features."

**What Was Built:**

- Production monitoring (Axiom logging infrastructure)
- Streaming UX (pre-stream skeletons, markdown stability)
- 5-turn rate limiting with auto-close
- E2E tests in CI (MSW mocking)
- Debate mode, decision tracking, AI summaries
- PDF upload and processing

**The PDF Processing Saga:**

- **Attempt 1:** pdf-parse (failed - requires Node.js native modules)
- **Attempt 2:** pdfjs-dist (failed - canvas dependency issues)
- **Attempt 3:** pdf2json (success - pure JavaScript, serverless-compatible)
- **Time Cost:** ~8 hours of late-night debugging

**Lesson:**

> "Research library compatibility BEFORE deep integration. Claude Code helped compare options, but we learned the hard way that serverless compatibility is non-negotiable."

**Final Metrics:**

- 143 commits, +33,847 net lines
- 695 total tests (673 passing, 96.8% pass rate)
- 264% test growth from Sprint 2
- **MVP FEATURE COMPLETE**

---

### 4. What Claude Code Did Well (250 words)

**Exceptional Strengths:**

**1. Database Schema Generation** (example with code)

```sql
-- Generated by Claude Code
CREATE TABLE loops (
  selected_persona_ids UUID[] NOT NULL,
  CONSTRAINT check_persona_count CHECK (
    array_length(selected_persona_ids, 1) BETWEEN 3 AND 5
  )
);
```

Saved days of work with proper relationships, RLS policies, and strategic indexes.

**2. API Endpoint Scaffolding**

- RESTful patterns (GET, POST, PATCH, DELETE)
- Zod validation schemas
- Consistent error handling
- Service layer abstraction

**3. Test Suite Creation**

- 695 tests across 3 tiers
- Vitest configuration
- Playwright E2E setup
- Integration test patterns

**4. Bug Detection**

- SQL injection discovered and fixed
- N+1 query patterns spotted
- Performance bottlenecks identified
- useSSEStream closure bugs found

**5. SSE Streaming Implementation**

- Async generator pattern in TypeScript
- Server-Sent Events with proper formatting
- Client-side useSSEStream hook
- Error handling mid-stream

**Impact:**

> "Claude Code handled ~54% of the development time - implementation, tests, and documentation. This freed me to focus on architecture, product decisions, and complex debugging."

---

### 5. Where I Took Control (200 words)

**Human-Critical Decisions:**

**1. Architecture Strategy**

- Multi-persona orchestration (sequential vs parallel)
- Database schema design (7 tables, relationships)
- Testing strategy (3-tier approach)
- Rate limiting approach (5-turn limit vs sliding window)

**2. Product Priorities**

- Sprint planning (which features first)
- Strategic pivot (monitoring > parallel LLM)
- UX priorities (streaming improvements)
- MVP scope definition

**3. Complex Debugging**

- PDF processing in serverless (3 library attempts)
- E2E test Playwright conflicts (MSW solution)
- Integration test flakiness (test user pooling)
- SSE controller mid-stream closure (try-catch placement)

**4. Performance Optimization**

- Database query optimization (N+1 elimination)
- API call deduplication (SWR cache strategy)
- CI/CD pipeline speedup (matrix parallelization)

**5. Security Review**

- RLS policy correctness
- Environment variable management
- Secrets handling in CI/CD

**Partnership Pattern:**

> "Claude Code suggested approaches, I made decisions. Claude Code generated code, I reviewed and refined. Claude Code wrote tests, I ensured coverage. Iterative partnership, not full automation."

---

### 6. The Real Costs (200 words)

**Time Investment:**

- ~306 estimated hours over 4 weeks
- ~11 hours/day average
- Multiple late-night debugging sessions

**Sprint Breakdown:**

- Sprint 1: ~64 hours (13h/day - database setup)
- Sprint 2: ~78 hours (11h/day - multi-advisor orchestration)
- Sprint 3: ~72 hours (10h/day - dashboard + E2E refactoring)
- Sprint 4: ~92 hours (12h/day - production readiness)

**Late-Night Work:**

- PDF processing debugging (until 2 AM)
- Integration test stability (weekend work)
- E2E test re-enablement (multiple evenings)
- Rate limits research (10 hours of analysis)

**What It's NOT:**

> "This wasn't a weekend hack. It's 4 weeks of focused development with proper testing, security, and production infrastructure. Claude Code accelerated it 2-3x, but it still required real commitment."

**API Costs (if shareable):**

- Anthropic API: $X during development
- Production monitoring: Axiom free tier
- Hosting: Vercel free tier
- Testing: $0 (MSW mocking)

**Productivity Gain:**

- Estimated 2-3x faster than solo without AI
- ~166 hours Claude Code contribution (54%)
- ~140 hours human contribution (46%)

---

### 7. Key Learnings (250 words)

**What Worked:**

1. **Testing from Day 1** - 132 tests in Sprint 1 prevented regressions
2. **Quality Pivots** - Mid-sprint adjustments based on test coverage
3. **Customer Collaboration** - Deprioritizing 3 features for better 3 improved MVP
4. **Documentation Concurrency** - Writing docs during development, not after
5. **Pre-commit Hooks** - ESLint/Prettier/TypeScript caught issues early
6. **Claude Code for Repetition** - API scaffolding, test generation, docs
7. **Human for Decisions** - Architecture, priorities, complex debugging

**What Didn't Work:**

1. **PDF Library Iteration** - 3 attempts wasted ~8 hours
2. **E2E Test Approach** - Should have used MSW from start
3. **Integration Test Pattern** - Shared user caused early flakiness
4. **Late-Night Work** - Effective but unsustainable (burnout risk)

**Top 5 Insights:**

1. **Partnership Beats Automation** - Claude Code + human decisions > either alone
2. **Test Early, Test Often** - 695 tests enabled aggressive refactoring without fear
3. **Research Library Compatibility** - Test serverless support before deep integration
4. **Customer Pivots Add Value** - Monitoring > parallel LLM for MVP
5. **Documentation Preserves Knowledge** - Concurrent docs prevent information loss

**For Other Builders:**

> "If you're building with AI assistance: let Claude Code handle repetitive tasks, but own your architecture decisions. Test from day one. Document concurrently. Pivot when data shows a better path. And don't skip the late-night debugging - that's where you learn the most."

---

### 8. The Result (150 words)

**Final Metrics:**

- Live at boailoop.vercel.app
- 468 commits, 114 TypeScript files
- 24 API endpoints, 7 database tables
- 695 tests (96.8% pass rate)
- Zero production incidents
- MVP feature complete in 4 weeks

**Core Features Delivered:**

- Multi-advisor perspectives (3-5 experts per question)
- Debate mode (advisors discuss and challenge each other)
- Decision tracking (accountability and outcomes)
- AI-powered summaries (actionable insights)
- Document integration (real business context)
- Persistent advisory sessions (loop history)

**Ready for Launch:**

> "The product is now ready for beta users. Not a weekend hack - a production-ready SaaS with comprehensive testing, monitoring, and security. Claude Code accelerated the journey, but the quality came from deliberate process choices."

---

### 9. Conclusion & CTA (100-150 words)

**One-Sentence Summary:**
"Building MABOA with Claude Code delivered a production-ready SaaS MVP in 4 weeks that would have taken 2-3x longer solo - not because AI wrote all the code, but because it freed me to focus on what mattered: architecture, product decisions, and quality."

**Key Takeaway:**

- Claude Code: 54% of time (implementation, tests, docs)
- Human: 46% of time (decisions, architecture, debugging)
- Result: 2-3x productivity gain with production-quality output

**Call to Action:**
"Building with AI assistance? Try Claude Code yourself - but remember: it's a partnership, not autopilot. Own your architecture, test relentlessly, and don't skip the hard debugging. That's where the real learning happens."

**Community Invitation:**
"I'd love to hear about your experiences building with AI coding assistants. What worked for you? What didn't? Share your story in the comments."

**Meta Element:**

> "P.S. This article outline was created with help from Claude Code - practicing what I preach."

**Hashtags:** #ClaudeCode #BuildInPublic #AIAssistedDevelopment

**Link to resources:**

- Live app: https://boailoop.vercel.app
- Claude Code: https://claude.com/claude-code

---

## Visual Plan

### Screenshots Needed (3-4)

1. **MABOA Dashboard** - Shows multi-advisor interface
2. **Loop History** - Demonstrates session persistence
3. **Test Results** - Screenshot of 695 passing tests
4. **Architecture Diagram** - Multi-persona orchestration flow

### Code Snippets (1-2)

1. **Database Schema** - Claude Code generated constraint

```sql
CONSTRAINT check_persona_count CHECK (
  array_length(selected_persona_ids, 1) BETWEEN 3 AND 5
)
```

2. **SSE Streaming** - Async generator pattern (optional)

```typescript
async function* streamPersonaResponses(personas, userMessage) {
  for (const persona of personas) {
    yield { personaId: persona.id, content: chunk.text };
  }
}
```

### Data Visualizations (1-2)

1. **Test Growth Chart** - Sprint 1 (132) → Sprint 4 (695)
2. **Sprint Velocity** - Issues completed per sprint (bar chart)

### Stock Photos (2-3)

- Code on laptop (tech workspace aesthetic)
- Team collaboration (even though solo, represents AI partnership)
- Ship/launch imagery (for MVP complete section)

---

## Engagement Optimization

### Title A/B Test Options

**Test A (Numbers-Driven):**
"Building a Production SaaS with Claude Code: 468 Commits, 695 Tests, Real Lessons"

**Test B (Journey-Focused):**
"From Solo Founder to Production: 4 Weeks with Claude Code (What Worked & What Didn't)"

**Test C (Outcome-Driven):**
"I Built an AI Advisory Board with Claude Code - Here's the Real Story"

### Opening Hook Variations

**Variation 1 (Time Transformation):**
"Four weeks ago, I had an idea. Today, it's live at boailoop.vercel.app with 695 automated tests."

**Variation 2 (Scale Emphasis):**
"468 commits. 114 TypeScript files. 695 tests. Zero production incidents. One solo founder with Claude Code."

**Variation 3 (Challenge/Solution):**
"How do you build a production SaaS in 4 weeks as a solo founder? Partner with Claude Code - but own your architecture."

### Section Headers (Engaging)

- "Sprint 1: Testing from Day One (The Decision That Saved Me)"
- "Sprint 2: When Claude Code Caught a Security Bug I Missed"
- "Sprint 3: 200% Velocity Without Breaking Production"
- "Sprint 4: The Customer Pivot That Made the MVP Better"
- "The PDF Processing Saga (Or: Why Compatibility Matters)"
- "What Claude Code Can't Do (And Why That's OK)"

---

## Publishing Checklist

### Pre-Publication

- [ ] Fact-check all metrics (commit counts, test numbers)
- [ ] Verify all links work (boailoop.vercel.app, Claude Code docs)
- [ ] Screenshot approvals (ensure no sensitive data)
- [ ] Code snippet syntax highlighting
- [ ] Grammar/spell check (Grammarly)
- [ ] Read aloud for flow

### Medium Optimization

- [ ] Add subtitle (1-2 sentences)
- [ ] Choose engaging header image
- [ ] Add alt text to all images
- [ ] Internal links to related Medium articles (if relevant)
- [ ] Choose 5 relevant tags (Claude Code, AI, Coding, Startup, SaaS)
- [ ] Consider publication submission (Better Programming, The Startup)

### Distribution

- [ ] Share on Twitter/X with key metrics
- [ ] Post in relevant subreddits (r/programming, r/SaaS, r/webdev)
- [ ] Share in Claude Code community (if exists)
- [ ] LinkedIn post (professional network)
- [ ] Dev.to cross-post (canonical URL to Medium)

---

## Success Metrics

**Target (1 month):**

- 1000+ views
- 50+ claps
- 10+ meaningful comments
- Bonus: Featured in Medium publication

**Engagement Indicators:**

- Read ratio (complete reads / total views)
- Comment quality (questions, shared experiences)
- Social shares (Twitter, LinkedIn)
- Inbound interest (DMs, emails)

---

**Outline Status:** ✅ Complete
**Next Step:** Draft first version following this structure
**Estimated Drafting Time:** 4-6 hours
**Target Publication Date:** TBD (after user review)
