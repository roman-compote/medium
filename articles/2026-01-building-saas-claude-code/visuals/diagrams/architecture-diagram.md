# Simplified Multi-Advisor Loop Architecture

## For Medium Article

This is a simplified version of the multi-advisor orchestration flow, optimized for Medium readers.

```mermaid
graph TB
    subgraph "User Interface"
        User[👤 User]
        UI[Next.js App<br/>React + TypeScript]
    end

    subgraph "MABOA Backend"
        API[API Routes<br/>Next.js Server]
        LoopService[Loop Orchestrator<br/>Sequential LLM Calls]
        DB[(Supabase<br/>PostgreSQL + Auth)]
    end

    subgraph "AI Layer"
        Claude1[Claude API<br/>Persona 1: CTO]
        Claude2[Claude API<br/>Persona 2: Marketing]
        Claude3[Claude API<br/>Persona 3: CFO]
    end

    User -->|Asks business question| UI
    UI -->|POST /api/loops/:id/turn| API
    API -->|Load context + personas| DB
    API -->|Orchestrate responses| LoopService

    LoopService -->|System prompt 1| Claude1
    LoopService -->|System prompt 2| Claude2
    LoopService -->|System prompt 3| Claude3

    Claude1 -->|Stream response| LoopService
    Claude2 -->|Stream response| LoopService
    Claude3 -->|Stream response| LoopService

    LoopService -->|SSE stream| API
    API -->|Real-time updates| UI
    UI -->|Display 3-5 perspectives| User

    API -->|Save messages| DB

    style User fill:#50C878,color:#fff
    style UI fill:#4A90E2,color:#fff
    style API fill:#4A90E2,color:#fff
    style LoopService fill:#E67E22,color:#fff
    style DB fill:#9B59B6,color:#fff
    style Claude1 fill:#E74C3C,color:#fff
    style Claude2 fill:#E74C3C,color:#fff
    style Claude3 fill:#E74C3C,color:#fff
```

## Rendering Instructions for Medium

1. Go to https://mermaid.live
2. Paste the mermaid code above
3. Adjust theme to "neutral" or "default"
4. Export as PNG (high resolution)
5. Upload to Medium
6. Add caption: "Multi-Advisor Loop Architecture: Sequential LLM calls orchestrated through a central service, streaming responses via SSE"

## Simplified Text Description (if diagram doesn't render)

**How Multi-Advisor Loops Work:**

1. **User asks a question** → Next.js frontend
2. **API loads context** → Persona profiles + conversation history from Supabase
3. **Loop Orchestrator** → Makes sequential calls to Claude API (one per persona)
4. **Each persona gets unique system prompt** → CTO, Marketing, CFO perspectives
5. **Responses stream back** → Server-Sent Events (SSE) for real-time updates
6. **UI displays 3-5 perspectives** → User sees diverse viewpoints simultaneously
7. **All messages saved** → Persistent loop history in PostgreSQL

**Key Constraint:** Sequential (not parallel) to manage costs and avoid race conditions

---

## Alternative: Even Simpler Flow (5 Boxes)

```
┌─────────────┐
│    User     │
│  Question   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Backend   │
│  Selects    │
│ 3-5 Personas│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Claude API  │
│ Sequential  │
│   Calls     │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ SSE Stream  │
│   Back to   │
│     UI      │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│   Display   │
│   Multiple  │
│ Perspectives│
└─────────────┘
```

This ASCII version could work directly in Medium if image doesn't load.
