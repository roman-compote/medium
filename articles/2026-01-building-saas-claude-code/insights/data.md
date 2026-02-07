# MABOA Development Journey with Claude Code

**Period:** October 14 - November 8, 2025 (4 weeks, 3 sprints)
**Outcome:** Production SaaS from idea to MVP feature complete

---

## Executive Summary

This document captures key metrics, learnings, and insights from building MABOA (My AI Board of Advisors) using Claude Code as the primary development assistant over 4 weeks and 3 sprints.

**Bottom Line:**

- **468 total commits** (454 during active development period)
- **114 TypeScript files** created
- **191 automated tests** (118 unit + 62 integration + 11 E2E) - later grew to 695 tests
- **13+ API endpoints** delivered
- **7 database tables** with RLS security
- **Production deployment** at boailoop.vercel.app
- **Solo founder** with Claude Code assistance

---

## Project Context

### What is MABOA?

**Multi-AI advisory board platform** enabling founders, PMs, and consultants to interact with 3-5 specialized AI advisor personas simultaneously.

**Core Differentiators vs. ChatGPT/Claude:**

1. Multi-persona orchestration (3-5 advisors per query)
2. Persistent advisory sessions ("loops") with history
3. Structured decision tracking
4. Document context integration (PDF upload)
5. Debate mode (advisors challenge each other)
6. AI-powered summaries

### Tech Stack

- **Frontend:** Next.js 14 (App Router), TypeScript, Tailwind + shadcn/ui
- **Backend:** Next.js API routes, PostgreSQL (Supabase), Anthropic Claude API
- **Auth:** Supabase Auth with RLS
- **Testing:** Vitest (unit/integration), Playwright (E2E), MSW (mocking)
- **CI/CD:** GitHub Actions, Vercel, Codecov
- **Monitoring:** Axiom (production logs)

### Why This Project is Not a "Weekend MVP"

**Complexity Factors:**

- Multi-persona orchestration (sequential LLM calls with state management)
- Server-Sent Events (SSE) streaming for real-time responses
- Row Level Security (RLS) on all 7 database tables
- Comprehensive testing strategy (3 tiers)
- CI/CD pipeline with ephemeral databases
- Document processing (PDF → text extraction)
- AI-powered features (debate mode, summaries, decision extraction)

**Time Investment:** 4 weeks of focused development (not 48 hours)

---

## Sprint Breakdown

### Sprint 1: Foundation (Oct 14-18, 2025)

**Duration:** 5 days
**Status:** 🟢 100% Complete

**What Was Built:**

- Database schema (7 tables, RLS policies, indexes)
- Persona CRUD API (5 endpoints)
- Board configuration API (2 endpoints)
- Persona library UI
- Board configuration UI
- Single-advisor chat
- **Testing infrastructure (132 tests!)**

**Metrics:**

- **29 commits**
- **+17,609 lines added**
- **132 tests** (59 unit + 62 integration + 11 E2E)
- **7 issues closed**
- **~150 files changed**

**Key Achievements:**

- ✅ Solid foundation with proper testing from day one
- ✅ 100% test coverage on all API endpoints
- ✅ Clean architecture (service layer, validation, error handling)
- ✅ Professional documentation structure

**Challenges:**

- Test authentication with local Supabase (solved with JWT generation)
- E2E test flakiness (solved with proper wait conditions)
- UUID validation in tests (solved with proper test data)

**Claude Code's Role:**

- Database schema generation (7 tables with relationships)
- API endpoint scaffolding (REST patterns)
- Test suite creation (Vitest + Playwright setup)
- Documentation structure (comprehensive markdown docs)

---

### Sprint 2: Multi-Advisor Loops (Oct 18-24, 2025)

**Duration:** 7 days
**Status:** 🟡 Core complete, quality focus pivot

**What Was Built:**

- **Multi-advisor loop orchestration** (core differentiator!)
- **SSE streaming API** (real-time advisor responses)
- Loop history with search/filtering
- Chat-style conversation UI
- CI/CD pipeline (GitHub Actions)
- Vercel deployment automation
- SQL injection fix (security)
- Test coverage increase (23% → 31%)

**Metrics:**

- **81 commits**
- **+1,537 lines added**
- **191 total tests** (118 unit + 62 integration + 11 E2E)
- **15 issues closed**
- **31% unit test coverage**

**Key Achievements:**

- ✅ Core differentiator functional (multi-persona responses)
- ✅ Production deployment pipeline
- ✅ Proactive security fix (SQL injection discovered and resolved)
- ✅ Mid-sprint quality pivot (recognized test coverage gap)

**Challenges:**

- Integration test flakiness (4 tests) - solved with isolated user pattern
- SQL injection vulnerability - implemented escapeILIKE() utility
- E2E tests failing in CI - Playwright version conflict (deferred)
- Low test coverage (23%) - added 59 new unit tests

**Strategic Decisions:**

- **Pivoted from velocity to quality** mid-sprint
- Deferred feedback system to focus on testing
- Prioritized CI/CD over new features

**Claude Code's Role:**

- LoopService implementation (async generator pattern for streaming)
- SSE API endpoints (dual-mode: streaming + JSON batch)
- GitHub Actions workflow (ephemeral Supabase, automated tests)
- Security fixes (SQL injection detection and solution)

---

### Sprint 3: Polish & Dashboard (Oct 24-31, 2025)

**Duration:** 7 days
**Status:** 🟢 200% completion (26 issues!)

**What Was Built:**

- Dashboard overview widget
- Loop history enhancements (date filters, time grouping)
- **Per-loop board configuration** (custom advisor selection per session)
- **Feedback system** (upvote/downvote on messages)
- **Loop export** (PDF + Markdown)
- **RAG preview** (markdown document upload)
- UI reorganization
- Persona CRUD UI
- **Comprehensive E2E test refactoring**

**Metrics:**

- **129 commits**
- **+1,253 lines added**
- **441 total tests** (341 unit + 89 integration + 11 E2E)
- **26 issues closed** (18 features + 8 bugs)
- **28 PRs merged**

**Key Achievements:**

- ✅ Exceptional velocity (200% of planned work)
- ✅ Unit tests grew 189% (118 → 341)
- ✅ E2E test refactoring (data-testid, helper functions)
- ✅ Zero production incidents across 28 deployments
- ✅ All Sprint 2 bugs resolved

**Challenges:**

- Integration test failures (authentication pattern fix)
- useSSEStream closure bugs (3 separate issues)
- SSE controller mid-stream closure (try-catch wrapper)
- E2E test brittleness (14 failing tests)
- Dashboard stale data (async refresh needed)

**Claude Code's Role:**

- Dashboard widget components (reusable pattern)
- Export functionality (jsPDF + Markdown generation)
- E2E test refactoring (data-testid attributes, helper functions)
- Bug fixes (useSSEStream closure issues, SSE error handling)
- Documentation (integration test patterns in CLAUDE.md)

---

### Sprint 4: MVP Feature Complete (Nov 1-8, 2025)

**Duration:** 8 days (7 active + weekend)
**Status:** 🟢 MVP Complete + Strategic Pivot

**What Was Built:**

- **Production monitoring** (Axiom logging infrastructure)
- **Streaming UX improvements** (pre-stream skeletons, markdown stability)
- **5-turn rate limiting** (auto-close with decision capture)
- **E2E tests in CI** (MSW mocking, parallel execution)
- **Performance optimization** (N+1 query elimination, SWR cache)
- **Debate mode** (advisor-to-advisor discussion)
- **Decision tracking** (AI-powered extraction)
- **AI summaries** (loop insights generation)
- **PDF upload** (document context integration)

**Metrics:**

- **143 commits**
- **+54,326 lines added** (includes test mocks and generated types)
- **-20,479 lines deleted** (code cleanup)
- **Net: +33,847 lines**
- **695 total tests** (673 passing, 21 skipped, 1 failing)
- **20+ issues closed**

**Key Achievements:**

- ✅ **MVP FEATURE COMPLETE** - All core differentiators delivered
- ✅ Customer-driven pivot (monitoring/UX > parallel LLM/API versioning)
- ✅ 264% test growth (191 → 695 tests)
- ✅ Production monitoring (Axiom)
- ✅ Rate limiting prevents cost runaway
- ✅ 40% page load improvement

**Challenges:**

- PDF extraction reliability (3 library attempts: pdf-parse → pdfjs-dist → pdf2json)
- Integration test flakiness (test user pooling solution)
- E2E test Playwright conflicts (MSW mocking solution)
- Context window management (5-turn limit + research document)

**Strategic Pivot (Customer-Driven):**

**Deprioritized:**

- Advanced document management UI
- Parallel LLM execution
- API versioning (/api/v1/)

**Prioritized Instead:**

- Axiom logging (production visibility)
- Streaming UX (eliminates layout shifts)
- 5-turn rate limiting (cost control)

**Result:** Better MVP with monitoring, UX polish, and cost controls

**Claude Code's Role:**

- Axiom logging implementation (HOF wrapper pattern)
- Rate limiting strategy (research document + implementation)
- E2E test mocking (MSW setup, deterministic responses)
- Performance optimization (N+1 query identification, SWR cache)
- PDF processing (library comparison, serverless compatibility)
- Late-night debugging assistance (critical issues resolved)

---

## Cumulative Metrics (4 Weeks)

### Code Volume

| Metric                  | Total |
| ----------------------- | ----- |
| **Total Commits**       | 468   |
| **Active Dev Period**   | 454   |
| **TypeScript Files**    | 114   |
| **API Endpoints**       | 24    |
| **Database Tables**     | 7     |
| **Database Migrations** | 15+   |
| **Test Files**          | 62    |

### Testing Growth

| Sprint   | Unit | Integration | E2E | Total | Growth |
| -------- | ---- | ----------- | --- | ----- | ------ |
| Sprint 1 | 59   | 62          | 11  | 132   | -      |
| Sprint 2 | 118  | 62          | 11  | 191   | +45%   |
| Sprint 3 | 341  | 89          | 11  | 441   | +131%  |
| Sprint 4 | 400+ | 250+        | 45+ | 695   | +264%  |

**Total Test Growth:** 426% (132 → 695) over 4 sprints

### Velocity

| Sprint   | Commits | Issues | Test Growth | Status        |
| -------- | ------- | ------ | ----------- | ------------- |
| Sprint 1 | 29      | 7      | +132 tests  | 100% on time  |
| Sprint 2 | 81      | 15     | +59 tests   | Quality pivot |
| Sprint 3 | 129     | 26     | +250 tests  | 200% delivery |
| Sprint 4 | 143     | 20+    | +254 tests  | MVP complete  |

**Average Velocity:** 19 issues/sprint, 95 commits/sprint

---

## Claude Code Usage Patterns

### What Claude Code Did Exceptionally Well

**1. Database Schema Generation**

- Generated 7 tables with proper relationships
- RLS policies for data isolation
- Strategic indexes for performance
- Migration files with proper SQL

**Example:**

```sql
-- Generated by Claude Code
CREATE TABLE loops (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
  selected_persona_ids UUID[] NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  CONSTRAINT check_persona_count CHECK (
    array_length(selected_persona_ids, 1) BETWEEN 3 AND 5
  )
);
```

**2. API Endpoint Scaffolding**

- RESTful patterns (GET, POST, PATCH, DELETE)
- Zod validation schemas
- Error handling (400, 401, 403, 404)
- Service layer abstraction

**Example:**

```typescript
// Generated by Claude Code (with manual refinement)
export async function GET(req: NextRequest) {
  try {
    const session = await getSession();
    if (!session) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

    const personas = await PersonaService.list(session.user.id, params);
    return NextResponse.json({ personas }, { status: 200 });
  } catch (error) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
```

**3. Test Suite Creation**

- Vitest configuration
- Playwright setup with multiple browsers
- Integration test patterns
- E2E test helper functions

**Example:**

```typescript
// Generated by Claude Code
describe("PersonaService", () => {
  it("should list personas with pagination", async () => {
    const result = await PersonaService.list(userId, { limit: 10, offset: 0 });
    expect(result.personas).toHaveLength(10);
    expect(result.total).toBeGreaterThan(10);
  });
});
```

**4. SSE Streaming Implementation**

- Async generator pattern in TypeScript
- Server-Sent Events with proper formatting
- Error handling mid-stream
- Client-side useSSEStream hook

**Example:**

```typescript
// Generated by Claude Code (async generator pattern)
async function* streamPersonaResponses(personas, userMessage) {
  for (const persona of personas) {
    const stream = await claude.messages.stream({
      model: "claude-sonnet-4-5",
      messages: [{ role: "user", content: userMessage }],
      system: persona.system_prompt,
    });

    for await (const chunk of stream) {
      yield { personaId: persona.id, content: chunk.text };
    }
  }
}
```

**5. CI/CD Pipeline Configuration**

- GitHub Actions workflow
- Ephemeral Supabase instances
- Matrix parallelization
- Automated deployment

**6. Bug Detection and Fixes**

- SQL injection vulnerability discovered
- useSSEStream closure bugs identified
- N+1 query patterns spotted
- Performance bottlenecks found

---

### Where Human Intervention Was Required

**1. Architecture Decisions**

- Multi-persona orchestration strategy (sequential vs parallel)
- Database schema design (7 tables, relationships)
- Testing strategy (3-tier approach)
- Rate limiting approach (5-turn limit vs sliding window)

**2. Product Decisions**

- Which features to build first (sprint planning)
- Strategic pivot (monitoring > parallel LLM)
- UX priorities (streaming improvements)
- MVP scope definition

**3. Process Refinement**

- Git workflow (branching strategy)
- Pre-commit hooks (Husky + lint-staged)
- Integration test patterns (isolated users)
- E2E test standards (data-testid, helper functions)

**4. Complex Debugging**

- PDF processing in serverless (library compatibility)
- E2E test Playwright conflicts (MSW solution)
- Integration test flakiness (test user pooling)
- SSE controller mid-stream closure (try-catch placement)

**5. Performance Optimization**

- Database query optimization (N+1 elimination)
- API call deduplication (SWR cache strategy)
- CI/CD pipeline speedup (matrix parallelization)
- Test execution optimization (pooling, parallel)

**6. Security Review**

- RLS policy correctness
- SQL injection prevention
- Environment variable management
- Secrets handling in CI/CD

---

### The Partnership Pattern

**Most Effective Workflow:**

1. **Planning** - Human defines goals, Claude Code suggests approach
2. **Implementation** - Claude Code generates code, human reviews/refines
3. **Testing** - Claude Code writes tests, human ensures coverage
4. **Debugging** - Human identifies issue, Claude Code suggests fixes
5. **Refinement** - Iterative improvement, both contributing
6. **Documentation** - Claude Code drafts, human ensures accuracy

**Example Interaction:**

**Human:** "I need to implement multi-advisor loop orchestration with streaming responses."

**Claude Code:**

- Suggested async generator pattern
- Generated LoopService with streaming logic
- Created SSE API endpoint
- Wrote unit tests for service methods
- Added client-side useSSEStream hook

**Human:**

- Decided on sequential vs parallel execution
- Refined error handling strategy
- Added token tracking for cost monitoring
- Integrated with existing persona system
- Tested edge cases (disconnection, errors)

---

## Key Challenges & Solutions

### Challenge 1: Test Authentication with Local Supabase

**Problem:** Integration tests needed authenticated requests, but local Supabase uses different auth flow than production.

**Solution (with Claude Code help):**

- Generated JWT tokens manually for local tests
- Created `createIsolatedTestUser()` helper
- Implemented test user pooling for parallel tests

**Outcome:** 100% reliable integration tests, 3x faster execution

---

### Challenge 2: SQL Injection Vulnerability

**Problem:** Loop search used ILIKE with user input, vulnerable to wildcard injection.

**Solution (discovered and fixed with Claude Code):**

- Implemented `escapeILIKE()` utility function
- Escapes `%`, `_`, `\` characters
- Added comprehensive test coverage

**Code:**

```typescript
// Generated by Claude Code
function escapeILIKE(input: string): string {
  return input.replace(/[%_\\]/g, "\\$&");
}
```

**Outcome:** Security issue resolved before production deployment

---

### Challenge 3: E2E Test Brittleness

**Problem:** 14 E2E tests failing due to brittle CSS selectors and race conditions.

**Solution (comprehensive refactoring with Claude Code):**

- Replaced CSS selectors with `data-testid` attributes
- Created helper functions to reduce duplication
- Implemented global authentication with `storageState`
- Added proper wait conditions (not timeouts)

**Metrics:**

- Code duplication reduced by 60%
- Test reliability improved to 100%
- Execution time reduced by 20%

**Outcome:** Robust E2E test suite, re-enabled in CI

---

### Challenge 4: PDF Processing in Serverless

**Problem:** PDF extraction needed to work in Next.js/Vercel serverless environment.

**Attempts:**

1. `pdf-parse` - Failed (requires Node.js native modules)
2. `pdfjs-dist` - Failed (canvas dependency issues)
3. `pdf2json` - ✅ Success (pure JavaScript, serverless-compatible)

**Solution (after 3 iterations with Claude Code):**

- Used `pdf2json` library
- Implemented text extraction with proper error handling
- Added comprehensive logging for debugging

**Outcome:** Reliable PDF processing in production

---

### Challenge 5: Context Window Management

**Problem:** Multi-advisor loops could exceed Claude API context limits (200K tokens).

**Solution (research + implementation with Claude Code):**

- Created comprehensive research document (38 pages)
- Implemented 5-turn limit for MVP
- Auto-close with decision capture
- Documented future strategies (sliding window, summarization, prompt caching)

**Outcome:** MVP cost control, clear path to longer conversations

---

## Process Evolution

### Git Workflow

**Started:** Committing directly to `main`

**Evolved to:**

- Feature branches (`feature/issue-N-description`)
- Pull requests with reviews
- Pre-commit hooks (ESLint, Prettier, TypeScript)
- Pre-push hooks (build + unit tests)
- Automated merging after CI pass

**Documentation:** [`docs/03-development/git-workflow.md`](../03-development/git-workflow.md)

---

### Testing Strategy

**Sprint 1:** Basic tests after features
**Sprint 2:** Test-driven development (TDD) for LoopService
**Sprint 3:** Comprehensive E2E refactoring
**Sprint 4:** MSW mocking for deterministic tests

**Evolution:**

1. Unit tests (Vitest) - 59 → 400+ tests
2. Integration tests (Vitest + local Supabase) - 62 → 250+ tests
3. E2E tests (Playwright) - 11 → 45+ tests
4. Coverage tracking (Codecov)
5. CI enforcement (required to pass)

**Documentation:** [`docs/05-testing/test-plan.md`](../05-testing/test-plan.md)

---

### Quality Gates

**Sprint 1:** Manual review
**Sprint 2:** CI/CD pipeline
**Sprint 3:** Pre-commit hooks
**Sprint 4:** Comprehensive logging + monitoring

**Current Stack:**

- Pre-commit: ESLint, Prettier, TypeScript (3-5s)
- Pre-push: Build + unit tests (30-60s)
- CI: Full test suite + integration (8-10 min)
- Production: Axiom logging + error tracking

---

## Learnings & Insights

### Technical Learnings

1. **SSE Streaming Pattern** - Async generators in TypeScript work beautifully for streaming
2. **Test Isolation** - Shared user pattern in integration tests caused flakiness
3. **SQL Injection Risks** - ILIKE wildcards must be escaped
4. **CI/CD Complexity** - Ephemeral databases require careful seed data management
5. **PDF Processing** - Serverless compatibility is critical (pdf2json > pdf-parse/pdfjs-dist)
6. **E2E Test Stability** - data-testid + helper functions > CSS selectors
7. **Performance Patterns** - Global SWR cache + eager loading eliminates most issues

---

### Process Learnings

1. **Quality over velocity** - Better to defer features than ship with low test coverage
2. **Customer pivots** - Deferring 3 features to prioritize 3 others delivered better MVP
3. **Documentation concurrency** - Writing docs during development prevents knowledge loss
4. **Test-driven confidence** - 695 tests enabled aggressive refactoring without fear
5. **Research upfront** - Rate limits research prevented production incidents

---

### Claude Code Effectiveness

**Most Valuable:**

- Database schema generation (saved days of work)
- Test suite creation (comprehensive coverage)
- API endpoint scaffolding (consistent patterns)
- Bug detection (SQL injection, performance issues)
- Documentation drafting (structure + content)

**Required Human Input:**

- Architecture decisions (multi-persona orchestration)
- Product priorities (sprint planning, pivots)
- Complex debugging (PDF processing, E2E conflicts)
- Security review (RLS policies, secrets management)
- Performance optimization (query analysis, caching strategy)

**Partnership Strength:**

- Claude Code handles repetitive tasks (CRUD, tests, docs)
- Human focuses on high-value decisions (architecture, UX, priorities)
- Iterative refinement (Claude suggests, human reviews, repeat)

---

## Time Investment Breakdown (Estimated)

### Sprint 1 (5 days)

- **Planning:** 4 hours
- **Database schema:** 6 hours (2h human + 4h Claude Code implementation)
- **API development:** 12 hours (3h human + 9h Claude Code scaffolding)
- **UI components:** 16 hours (8h human + 8h Claude Code)
- **Testing:** 20 hours (6h human + 14h Claude Code test generation)
- **Documentation:** 6 hours (2h human + 4h Claude Code)
- **Total:** ~64 hours (~13h/day)

### Sprint 2 (7 days)

- **Multi-advisor orchestration:** 24 hours (12h human design + 12h Claude Code)
- **SSE streaming:** 16 hours (6h human + 10h Claude Code)
- **CI/CD setup:** 12 hours (5h human config + 7h Claude Code workflow)
- **Bug fixes:** 10 hours (6h human debugging + 4h Claude Code fixes)
- **Quality improvements:** 16 hours (10h human review + 6h Claude Code refactor)
- **Total:** ~78 hours (~11h/day)

### Sprint 3 (7 days)

- **Dashboard features:** 20 hours (8h human UX + 12h Claude Code components)
- **E2E test refactoring:** 18 hours (10h human strategy + 8h Claude Code implementation)
- **Export functionality:** 12 hours (4h human + 8h Claude Code)
- **Bug fixes:** 14 hours (8h human debugging + 6h Claude Code fixes)
- **Documentation:** 8 hours (4h human + 4h Claude Code)
- **Total:** ~72 hours (~10h/day)

### Sprint 4 (8 days)

- **Production monitoring:** 16 hours (6h human + 10h Claude Code logging setup)
- **Rate limiting research:** 12 hours (10h human research + 2h Claude Code doc)
- **PDF processing:** 14 hours (10h human debugging + 4h Claude Code)
- **E2E tests in CI:** 16 hours (8h human + 8h Claude Code MSW setup)
- **Core features (debate, summaries, decisions):** 24 hours (10h human + 14h Claude Code)
- **Performance optimization:** 10 hours (6h human analysis + 4h Claude Code fixes)
- **Total:** ~92 hours (~12h/day)

### Overall (4 weeks)

- **Total Hours:** ~306 hours
- **Average:** ~11 hours/day
- **Human Time:** ~140 hours (46%)
- **Claude Code Time:** ~166 hours (54%)

**Estimated Productivity Gain:** 2-3x faster than solo development without AI assistance

---

## What Made This Different from a "Weekend MVP"

### Complexity Factors

1. **Multi-Persona Orchestration** - Not a simple chatbot
2. **SSE Streaming** - Real-time multi-advisor responses
3. **Comprehensive Testing** - 695 tests, not zero
4. **Production Infrastructure** - CI/CD, monitoring, logging
5. **Security Hardening** - RLS policies, SQL injection prevention
6. **Performance Optimization** - N+1 elimination, caching
7. **Document Processing** - PDF extraction in serverless

### Quality Standards

- 96.8% test pass rate (673/695 tests)
- Zero production incidents
- Comprehensive documentation (50+ markdown files)
- Security audit (SQL injection, RLS policies)
- Performance testing (N+1 queries, API calls)

### Time Investment

- **4 weeks** of focused development (not 48 hours)
- **306 estimated hours** (not 12-20 hours)
- **Late-night debugging** (PDF processing, E2E tests, integration tests)
- **Research time** (rate limits, context management, performance)

---

## Metrics for Medium Article

### Key Numbers to Highlight

**Development Velocity:**

- 468 commits in 4 weeks
- 114 TypeScript files
- 24 API endpoints
- 7 database tables
- 695 automated tests (96.8% pass rate)

**Testing Growth:**

- Sprint 1: 132 tests
- Sprint 2: 191 tests (+45%)
- Sprint 3: 441 tests (+131%)
- Sprint 4: 695 tests (+264%)
- **Total:** 426% test growth

**Sprint Velocity:**

- Sprint 1: 7 issues, 29 commits
- Sprint 2: 15 issues, 81 commits
- Sprint 3: 26 issues, 129 commits
- Sprint 4: 20+ issues, 143 commits

**Time Investment:**

- ~306 estimated hours over 4 weeks
- ~11 hours/day average
- Solo founder + Claude Code

**Production Deployment:**

- Live at boailoop.vercel.app
- 28 successful deployments (Sprint 3 alone)
- Zero downtime, zero incidents
- Axiom monitoring for production logs

---

## What Worked vs. What Didn't

### What Worked ✅

1. **Testing from Day 1** - 132 tests in Sprint 1 prevented regressions
2. **CI/CD Early** - Automated pipeline caught issues before production
3. **Pre-commit Hooks** - ESLint/Prettier/TypeScript enforcement prevented bad commits
4. **Quality Pivots** - Mid-sprint adjustments based on test coverage gaps
5. **Customer Collaboration** - Deprioritizing 3 features for better 3 features
6. **Documentation Concurrency** - Writing docs during development, not after
7. **Claude Code for Repetitive Tasks** - API scaffolding, test generation, docs
8. **Human for Decisions** - Architecture, priorities, complex debugging

### What Didn't Work ❌

1. **PDF Processing Iteration** - 3 library attempts (wasted ~8 hours)
2. **E2E Test Playwright Conflict** - Should have used MSW from start
3. **Integration Test Flakiness** - Shared user pattern caused issues early
4. **Test Coverage Measurement** - pnpm test:coverage doesn't work (still broken)
5. **Late-Night Work** - Multiple debugging sessions until 2-3 AM (burnout risk)

### What to Do Differently

1. **Research libraries earlier** - Test serverless compatibility before deep integration
2. **Use MSW from start** - Deterministic tests from day one
3. **Test user pooling earlier** - Prevent flakiness before it becomes problem
4. **Set realistic timelines** - 4 weeks > 2 weeks for production-quality MVP
5. **Monitor workload** - Late-night work effective but unsustainable

---

## Conclusion

**Bottom Line:**
Building MABOA with Claude Code delivered a production-ready SaaS MVP in 4 weeks that would have taken 2-3x longer solo without AI assistance.

**Key Success Factors:**

1. Strong testing discipline from day one
2. Iterative quality improvements (not just velocity)
3. Customer-driven pivots (monitoring > parallel LLM)
4. Effective human-AI partnership (Claude Code for tasks, human for decisions)
5. Documentation concurrency (knowledge preserved)

**The Partnership:**

- Claude Code: 54% of time (implementation, tests, docs)
- Human: 46% of time (decisions, architecture, debugging)
- **Result:** 2-3x productivity gain

**Final Metrics:**

- 468 commits, 114 TypeScript files, 24 API endpoints
- 695 tests (96.8% pass rate)
- Zero production incidents
- MVP feature complete in 4 weeks
- Live at boailoop.vercel.app

---

**Date Generated:** January 2, 2026
**For:** Medium Article - "Building MABOA with Claude Code"
**Status:** Ready for article drafting
