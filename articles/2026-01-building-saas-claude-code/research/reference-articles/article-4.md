# How I Built My Personal AI Writing Agent with Claude Code (And You Can Too)

[

![Paul Sherman](https://miro.medium.com/v2/resize:fill:64:64/0*DddbudmmeEhjEhRO.jpeg)

](https://medium.com/@pa_sherman?source=post_page---byline--4f3ae29019d2---------------------------------------)

[Paul Sherman](https://medium.com/@pa_sherman?source=post_page---byline--4f3ae29019d2---------------------------------------)

Follow

10 min read

·

Sep 17, 2025

25

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/1*GpNyOkl4Cez94YZMLRCHkA.jpeg)

Last month, I spent 23 hours writing a single long-form article. Between research, drafting, editing, creating visuals, and adapting it for different platforms, nearly an entire work week vanished. Sound familiar? If you’re a content creator, developer-turned-writer, or entrepreneur managing your own content, you know this pain intimately. But what if I told you that same article now takes me just 5 hours — with better consistency and quality?

This isn’t another “AI will write everything for you” pitch. It’s the story of how I built a practical, customisable AI writing system using Claude Code as the orchestration layer, combining multiple AI services into a seamless pipeline that maintains my voice whilst eliminating the repetitive drudgery of content creation. And yes, you can build this too — even if you’re not a developer.

## The Problem: Why Traditional Content Creation Is Broken

Let’s be honest about what content creation really looks like in 2025. You sit down to write, but first you need to research. Three hours later, you’re deep in browser tabs, trying to remember which statistic came from where. You finally start writing, but halfway through, you realise your tone has shifted. The introduction sounds professional; the conclusion reads like a late-night ramble.

Then there’s the mechanical work. Formatting for Medium. Rewriting for LinkedIn. Creating social posts. Generating images. Each platform wants something slightly different, and you’re manually adapting everything. No wonder Brian Casel talks about systemising before automating — most of us don’t even know what our process is because we’re too busy drowning in it.

IndyDevDan’s approach resonated with me: document your process first, then identify what can be automated. When I actually tracked my time, the results were shocking:

- **Research and fact-checking**: 6 hours (endless rabbit holes)
- **First draft writing**: 8 hours (including procrastination)
- **Editing and revisions**: 4 hours (never quite satisfied)
- **Visual content creation**: 3 hours (I’m not a designer)
- **Platform adaptation**: 2 hours (reformatting everything)
- **Total**: 23 hours for one comprehensive article

But here’s the real kicker — the quality varied wildly. Monday-me writes differently from Friday-me. Morning-me is verbose; afternoon-me is terse. Without a system, every piece of content is a unique snowflake, making it impossible to build a recognisable brand voice.

## The Solution: Agent OS — My AI Writing Command Centre

Instead of using AI as a replacement writer, I discovered Brian Casel’s Agent OS (Agent Operating System) — an intelligent orchestration framework that he developed for coding workflows. After playing with it for a few weeks, I became fascinated by its potential. To really understand how it worked, I reviewed each line of script and every prompt. That’s when I realised I could modify this coding-based system to focus on article research and writing.

Think of Agent OS as a conductor leading an orchestra where each AI service is a specialised musician. In my modified version, Claude handles the writing, Gemini assists with research, FAL.AI creates visuals, and Claude Code coordinates everything through simple commands. Brian’s original framework provided the foundation; I adapted it to solve my content creation challenges.

Here’s what my workflow looks like now:

# Start a new article

/plan-article

# Generate comprehensive research

/create-research

# Write the full article

/create-article

# Generate cover image

/create-image

# Create social media posts

/create-social

Five commands. Five hours total. Same quality every time.

The magic isn’t in the individual commands — it’s in how they work together. Each command triggers a specific agent that follows predefined workflows, ensuring consistency whilst maintaining flexibility for different content types.

## Building Your Own: The Architecture

## The Foundation: File System as Database

Forget complex databases or cloud services. Agent OS uses a simple file structure that’s version-controlled with Git:

.agent-os/  
├── instructions/ # Your workflow definitions  
│ └── core/  
│ ├── plan-article.md  
│ ├── create-research.md  
│ └── create-article.md  
├── standards/ # Your style guide  
│ └── writing-practices.md  
└── [article-name]/ # Each article's workspace  
 ├── article-brief.md # Planning document  
 ├── research/ # Research from multiple AIs  
 ├── article.md # Final content  
 └── social-media/ # Platform-specific posts

This structure serves multiple purposes. It’s self-documenting, easily searchable, works offline, and integrates seamlessly with any text editor. Plus, you can track changes, roll back mistakes, and share workflows with others.

## The Commands: Your Content Creation Toolkit

#### `/plan-article`: Strategic Thinking First

This command forces you to think before you write. It generates a structured brief with:

- Working title options
- Target audience personas
- Key topics to cover
- Success metrics
- Distribution strategy

Here’s an actual brief it generated for a technical article:

## User Personas

### Developer-Turned-Creator (30-45 years old)

- **Role:** Software developer creating content
- **Pain Points:**
  - Finding time alongside primary work
  - Maintaining writing consistency
  - Translating technical concepts for broader audiences
- **Goals:**
  - Automate routine content tasks
  - Build thought leadership
  - Create scalable content operations

The agent doesn’t just template this — it adapts based on your input, creating genuinely useful planning documents that guide the entire process.

#### `/create-research`: Multi-AI Intelligence Gathering

Instead of relying on a single AI model, this command orchestrates multiple services:

# Simplified version of what happens under the hood

def create_research(topic):  
 # Claude provides analytical depth  
 claude_research = claude.analyze(  
 topic=topic,  
 focus="technical_implementation"  
 )  
 # Gemini offers current information  
 gemini_research = gemini.research(  
 topic=topic,  
 focus="recent_developments"  
 )  
 # Synthesise into comprehensive research  
 return combine_research(claude_research, gemini_research)

The result? Research documents that are both deep and current, combining Claude’s analytical capabilities with Gemini’s access to recent information.

#### `/create-article`: Where the Magic Happens

This is where your research transforms into publication-ready content. The command:

1. Reads your article brief and research
2. Applies your writing standards
3. Generates content following your output style
4. Ensures consistency with your brand voice

But here’s the crucial part — it’s not just generating text. It’s following your specific rules:

# From my article-writer.md configuration

priorities:

- clarity over cleverness
- evidence over opinion
- practical over theoretical  
  voice:
- first-person when sharing experience
- active voice throughout
- conversational but professional

## The Agents: Your Specialised Assistants

Agents are specialised configurations that handle specific tasks. Think of them as employees with clearly defined roles:

#### Context-Fetcher Agent

This agent intelligently retrieves information without overwhelming the system. It checks if content is already loaded, extracts only relevant sections, and summarises when appropriate. No more copy-pasting entire documents.

#### File-Creator Agent

Handles all file operations with templates and proper formatting. When you create an article, it automatically structures it with the right metadata, headings, and sections. No more manual formatting.

#### Project-Manager Agent

Tracks task completion and maintains your content roadmap. It knows which articles are in progress, what’s been published, and what’s scheduled next. Your personal content assistant that never forgets.

## The Output Style: Your Voice, Systematised

The biggest fear with AI content is losing your unique voice. Agent OS solves this through output styles — detailed configurations that define exactly how you write:

# My actual article-writer.md configuration

Writing Approach:

- Prioritise clarity and engagement
- Use active voice and compelling language
- Structure with clear headings and logical flow
- Include relevant examples and evidence
- Maintain consistent tone throughout  
  Content Development Process:

1. Research Phase: Gather verified information
2. Outline Creation: Structured planning
3. Draft Writing: Comprehensive first draft
4. Review & Edit: Quality and consistency
5. Final Polish: SEO and readability

This isn’t a template — it’s a living document that evolves with your writing. Every article follows these principles whilst adapting to the specific topic and audience.

## Real Results: The 78% Time Reduction

Let’s talk numbers, because that’s what matters:

## Time Investment

**Before Agent OS:**

- Research: 6 hours
- Writing: 8 hours
- Editing: 4 hours
- Visuals: 3 hours
- Social: 2 hours
- **Total: 23 hours**

**After Agent OS:**

- Setup/Planning: 1 hour
- Command Execution: 0.5 hours
- Review/Editing: 2 hours
- Customisation: 1 hour
- Publishing: 0.5 hours
- **Total: 5 hours**

That’s a 78% reduction. But time isn’t everything…

## Quality Metrics

- **Voice consistency**: 95% (vs 70% manual)
- **Error rate**: 2% (vs 8% manual)
- **SEO optimisation**: 90% (vs 60% manual)
- **Publishing frequency**: 4x increase

The consistency improvement alone justifies the system. Readers now recognise my content immediately, building stronger brand recognition.

## Implementation: Your First AI Writing Pipeline

Ready to build your own? Here’s how to start:

## Step 1: Install Claude Code

# If you haven't already

npm install -g @anthropic/claude-code

## Step 2: Create Your File Structure

# Create the foundation

mkdir -p .agent-os/instructions/core  
mkdir -p .agent-os/standards  
mkdir -p .claude/output-styles

## Step 3: Define Your Writing Style

Create `.claude/output-styles/your-style.md`:

# Your Writing Style

## Voice Parameters

- Tone: [casual/professional/academic]
- Perspective: [first/third person]
- Energy: [high/moderate/calm]

## Content Principles

- [Your principle 1]
- [Your principle 2]
- [Your principle 3]

## Avoid

- [What to avoid 1]
- [What to avoid 2]

## Step 4: Create Your First Command

Start simple with a planning command:

# plan-article.md

When the user says /plan-article:

1. Ask for title, topic, and audience
2. Create directory structure
3. Generate article-brief.md
4. Include personas, objectives, and success metrics

## Step 5: Test and Iterate

# Try your first command

/plan-article

# Check the output

cat .agent-os/[your-article]/article-brief.md

# Refine based on results

## Common Pitfalls and How to Avoid Them

## Pitfall 1: Over-Automation Syndrome

**The Trap**: Trying to automate everything immediately.

**The Fix**: Start with one content type. Perfect it. Then expand. I began with blog posts, then added social media, then email newsletters. Each addition built on previous learnings.

## Pitfall 2: Loss of Personal Voice

**The Trap**: Content becomes generic, sounding like every other AI-generated piece.

**The Fix**: Regularly update your voice parameters. Feed the system examples of your best manual writing. Review and edit outputs, feeding corrections back into the system.

## Pitfall 3: Context Overflow

**The Trap**: Providing too much information, overwhelming the AI and getting confused outputs.

**The Fix**: Use the context-fetcher agent to selectively load only relevant information. Summarise aggressively. Remember, constraints often produce better results than unlimited context.

## Pitfall 4: API Cost Explosion

**The Trap**: Running expensive operations repeatedly, burning through credits.

**The Fix**: Implement caching for research. Batch operations where possible. Use cheaper models for initial drafts, premium models for final polish.

## Advanced Techniques: Level Up Your System

## Multi-Model Orchestration

Don’t rely on a single AI. Leverage each model’s strengths:

def create_comprehensive_content(topic):  
 # Gemini for research breadth  
 research = gemini.explore(topic)  
 # Claude for analytical depth  
 analysis = claude.analyze(research)  
 # GPT-4 for technical examples  
 examples = gpt4.generate_code_samples(topic)  
 # Combine intelligently  
 return synthesize(research, analysis, examples)

## Dynamic Template Generation

Instead of static templates, generate them based on context:

def generate_template(content_type, audience, goal):  
 if audience == "developer" and goal == "tutorial":  
 return technical_tutorial_template()  
 elif audience == "executive" and goal == "strategy":  
 return thought_leadership_template()  
 else:  
 return standard_template()

## Feedback Loop Integration

Build learning into your system:

# After each article

1. Track performance metrics
2. Identify what worked/didn't
3. Update voice parameters
4. Refine templates
5. Adjust agent prompts

## The Transformation: From Creator to Curator

The biggest shift isn’t technical — it’s psychological. You move from being a writer to being a curator and strategist. Instead of agonising over every word, you’re making high-level decisions about direction, tone, and strategy.

This doesn’t diminish creativity; it amplifies it. When you’re not exhausted from mechanical tasks, you have energy for the work that matters:

- Developing unique perspectives
- Building relationships with readers
- Experimenting with new formats
- Planning content strategy
- Engaging with your community

As Brian Casel says, “Systems create freedom.” This system hasn’t replaced my creativity — it’s liberated it.

## What’s Next: The Future of AI-Assisted Content

We’re just scratching the surface. Here’s what I’m exploring next:

## Real-Time Collaboration

Multiple writers working with the same Agent OS instance, maintaining consistent voice across a team.

## Audience Feedback Integration

Automatically adjusting content based on engagement metrics, comments, and reader behaviour.

## Multi-Format Adaptation

One piece of content automatically adapted for articles, videos scripts, podcast outlines, and email courses.

## Predictive Content Planning

AI suggesting topics based on trending discussions, search patterns, and audience interests.

## Your Turn: Start Small, Think Big

You don’t need to build everything at once. Start with a single command. Maybe it’s `/plan-article` to structure your thinking. Or `/create-social` to stop spending an hour on LinkedIn posts.

The key is to begin. Document your current process. Identify the repetitive parts. Build one simple automation. Test it. Improve it. Then add another.

Remember IndyDevDan’s wisdom: systematic beats sporadic every time. And Brian Casel’s reminder: the goal isn’t to automate everything — it’s to automate the right things so you can focus on what only you can do.

## Conclusion: The 5-Hour Article That Changes Everything

This article you’re reading? It was created using the exact system I’ve described. The research was comprehensive, the writing maintains my voice, and the entire process took 5 hours instead of 23. But more importantly, I enjoyed creating it because I focused on the ideas, not the implementation.

If you’re drowning in content creation, spending more time on mechanical tasks than creative thinking, it’s time to build your own Agent OS. Not because AI will replace you, but because it will amplify what makes you unique.

The tools exist. The methods are proven. The only question is: will you keep grinding through 23-hour articles, or will you build a system that gives you back 18 hours to focus on what really matters?

Start today. Run your first command. Build your first agent. Transform your first article. Your future self — the one with time to think, create, and innovate — will thank you.

*Ready to build your own AI writing system? Start with the* [_Claude Code documentation_](https://docs.anthropic.com/claude-code)*, explore the* [_Agent OS framework_](https://buildermethods.com/agent-os)_, or share your journey with the hashtag #AgentOSWriting. The community is here to help, and I’d love to see what you create._

_Follow me for more insights on AI automation, cyber security, content creation systems, and the practical intersection of technology and creativity. Because the future isn’t about AI replacing writers or security professionals, it’s about writers who leverage AI replacing those who don’t._

[

AI

](https://medium.com/tag/ai?source=post_page-----4f3ae29019d2---------------------------------------)

[

Writing

](https://medium.com/tag/writing?source=post_page-----4f3ae29019d2---------------------------------------)

[

Writing Tips

](https://medium.com/tag/writing-tips?source=post_page-----4f3ae29019d2---------------------------------------)

[

Claude

](https://medium.com/tag/claude?source=post_page-----4f3ae29019d2---------------------------------------)

[

Productivity

](https://medium.com/tag/productivity?source=post_page-----4f3ae29019d2---------------------------------------)
