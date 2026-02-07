# I Built an App with Claude Code… But Claude Wasn’t the Point

[

![Deyan Aleksandrov](https://miro.medium.com/v2/resize:fill:64:64/1*VltxKsbV88y43hjFUSBs2A@2x.jpeg)

](https://medium.com/@didoaint?source=post_page---byline--9540cda9a6e6---------------------------------------)

[Deyan Aleksandrov](https://medium.com/@didoaint?source=post_page---byline--9540cda9a6e6---------------------------------------)

Follow

7 min read

·

4 days ago

5

## The Hook

**The irony** wasn’t lost on me:

I used an AI coding assistant to create a dashboard that excludes the assistant for tasks that can run statically on the API alone, but includes the assistant for PR reviews when necessary.

A few days, a lot of prompts, and now **255** [**beads**](https://github.com/steveyegge/beads) **issues** later, I ended up with something more interesting (at least to me) than “just another AI wrapper”:

**The twist**:  
The more I leaned on Claude Code to build the app, the more I wanted the app itself to *NOT* lean on Claude Code. Wherever possible, I wanted plain APIs, local logic, and headless workflows that would keep working even if I swapped the AI out.

## The Original Pain: Too Many Tabs, Not Enough Flow

My typical morning looked like this:

- Open Issue Tracker (e.g. Jira), check tickets assigned to me or to others.
- Open Git Tracker (e.g. GitHub, GitLab), check PRs needing review.
- Open CI/CD Service (e.g. Bitrise, GitLab CI), see what’s red or green, get a build out.
- Open Messaging App (e.g. Teams, Slack), write a status update by hand …

Each step is fine in isolation. Together, it’s a “18 tabs open and zero real flow” situation.

The obvious advice is to *just use an AI plugin/command inside Claude Code*. I do. Or *just use an AI plugin inside Jira*. I do that too.  
They’re super useful. But they’re still trapped inside each tool, or they’re incomplete and they don’t give me:

- One place to see what’s ready to work on.
- One place to see failing builds.
- One place to see PRs that need attention.
- One place where AI can help with reviews and summaries, without jumping between tabs.

**So I built a small macOS cockpit for myself**.

## Beads: The Issue System Behind It

Before getting into the app, a quick nod to [**beads**](https://github.com/steveyegge/beads). I used my cockpit project as an excuse to properly test [**beads**](https://github.com/steveyegge/beads) for git‑native issues and dependency graphs with Claude Code, and I’m genuinely happy with it.

The numbers (255 issues, etc) above in the first section of the article are from that system. The dependency graphs and “ready to work” list made it much easier to ask a simple question: *“What should I do next?”* and get a straight answer.

I had originally planned a bigger comparison in this article between:

That deep dive can be its own article (and it will be). In *this* one, the important part is simpler: **beads did its job well enough** that I stopped thinking about my planning tool and focused on building the app.

## Building With Claude, But Not Around It

**Claude Code still did all of the heavy lifting**:

- Wiring API clients for all git tracking, ticket tracking and CI/CD services *because it knows them*.
- Building the macOS UI and wiring it to those clients.
- Generating issue templates, refactors, and *unit tests* ( **512 of them so far**).

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*ewEMPu1E1F-76l4E)

But every time I hit a design decision, I tried to ask:

> _“Can this feature run without Claude? Can the app still be useful if I swap the AI provider or turn it off?”_

That question changed how I structured things.

## What the App Handles Directly

Anywhere the standard APIs were enough, the app uses them directly:

- **Issue Tracker** — saved queries, filters, and ticket details.
- **Git Tracker** — listing PRs, statuses, basic metadata.
- **Build service** — triggering builds where it makes sense.
- **Local notifications** — reminders for saved queries or conditions I care about.

None of that requires AI to function. It’s simply a streamlined UI over APIs that I would otherwise use individually.

## Where AI Still Adds Real Leverage

Then there are a few spots where AI really *does* change the experience:

- From the dashboard, I can select multiple PRs and trigger reviews.
- Reviews run as background jobs.
- Each one produces a structured summary with findings and checkboxes.
- When I select what I agree with, the app posts a GitHub review from my account with the correct line‑level comments.

This feels like the **“killer feature”**: I can run multiple reviews in parallel and then apply judgment, instead of reading every PR from scratch.

- Short, consistent summaries for status updates or messaging app posts.

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*YwRL5-dY4kAAA52z)

- For many cases, Apple’s local foundation models are enough (and free).

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*I576Wj9A2exRiIWM)

- For heavier contexts or trickier summaries, I can fall back to Claude or another provider.

The design is “AI tiered by cost and capability”, not “everything through the most expensive model by default”.

So the AI is important-but it’s not the only brain. The app is built so that most of the value comes from the workflow and aggregation, not from one specific model.

## Living With AI Amnesia

Of course, working with Claude Code itself wasn’t perfectly smooth. I set clear instructions like “_use the beads issue tracker for planning, not todos_”, and still had loops like:

Claude: Let me create a todo list to track this...  
Me: Use the issue tracker, not todos.  
Claude: You're right, I'll create issues instead. [Later...]  
Claude: I'll add this to the todo list...

Some of that is context limits, some is built‑in prompts leaning toward native tools. The practical takeaways for me:

- You need **constant reminders** about your workflow — the `CLAUDE.md` file has instructions for using [**beads**](https://github.com/steveyegge/beads) but is not always respected.
- You need **short, explicit prompts** like “Plan this as [**beads**](https://github.com/steveyegge/beads) issues” instead of hoping it remembers.
- You need to **accept that a bit of drift** and correction is normal.

Again, [**beads**](https://github.com/steveyegge/beads) helped here — once issues existed in the repo and I reminded the bot to use them, they survived the AI’s memory lapses.

## A Quick Detour: Designing the Icon (And Failing Figma’s AI)

Another fun side quest — **the icon**.

I’m not a designer, but I wanted something that felt at home next to Xcode, VS Code, etc. So I tried:

The results were… NOT fine. For me, Figma’s AI was useful as a brainstorming nudge, but not as “give me a final icon”. If it worked it would’ve been too easy.

![](https://miro.medium.com/v2/resize:fit:1216/0*UQn8KQjBWjWhglNO)

- What ended up working was using believe it or not, Perplexity!
- A few iterations on a “control stand” / tower motif and I had something I can work it.
- Iterating on colors and lighting.
- A final touch-up through the Icon Composer macOS App, and I was all set.

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*eAh5gkCvsCaYUOKn)

That whole process could be its own short article: *“I tried to get Figma’s AI to design my app icon. It didn’t. Here’s what actually worked — Perplexity.”*

For this story, it’s just another example of the same pattern:  
AI can help, but the workflow and judgment still have to be yours.

## Notifications, Flags, and Keeping It Yours

A few other parts that turned out surprisingly useful:

- **Local notifications** — for saved queries or “watchlists”; easily testable from settings so you can check your notification logic without waiting a week.

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*yaXZq0jkzG88D0oN)

- **Feature flags** — simple switches to hide integrations I’m not using at the moment. This keeps the cockpit focused instead of becoming a cluttered control panel.

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/0*q8DbJG6BSd0W6yGV)

None of this is technically complex, but together they make the app feel like *my* GroundCTRL cockpit, not just a generic dashboard.

## Takeaways

From this round, the main lessons for me:

- **Using Claude Code to build an app is great, but the app shouldn’t depend on Claude Code to be useful.**
- [**beads**](https://github.com/steveyegge/beads) **work well for multi‑session, dependency‑heavy work** — good enough that I trust them as the planning backbone.
- **APIs first, AI second** — if Issue Tracker/Git Tracker/CI already give you the data you need, call them directly and save **AI for summaries, PR reviews, and decision support**.
- **Headless AI PR reviews with a human in the loop feel like a real multiplier** — let the model do the first pass, you decide what actually gets submitted.
- **Design tools with AI are not magic** — they can suggest directions, but for things like app icons you still need to drive.

The bottleneck isn’t typing anymore. It’s orchestration — picking the right mix of APIs, local logic, and AI so that your tools match how you really work.

**And that’s what this little cockpit is for.**

*Originally published at* [_https://blog.groundctrl.dev_](https://blog.groundctrl.dev/i-built-an-app-with-claude-code-but-claude-wasnt-the-point) *on December 28, 2025.*

[

Claude Code

](https://medium.com/tag/claude-code?source=post_page-----9540cda9a6e6---------------------------------------)

[

Macos

](https://medium.com/tag/macos?source=post_page-----9540cda9a6e6---------------------------------------)

[

Api Integration

](https://medium.com/tag/api-integration?source=post_page-----9540cda9a6e6---------------------------------------)

[

Jira

](https://medium.com/tag/jira?source=post_page-----9540cda9a6e6---------------------------------------)

[

Github

](https://medium.com/tag/github?source=post_page-----9540cda9a6e6---------------------------------------)
