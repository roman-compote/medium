# **GitHub Copilot (Gen-AI) is Helpful, But Not Great (March 2025)**

[

![Mark Pelf](https://miro.medium.com/v2/resize:fill:64:64/1*h5TZpTwOw45EFicJZCra8Q.jpeg)

](https://medium.com/@mark.pelf?source=post_page---byline--db655ca50c53---------------------------------------)

[Mark Pelf](https://medium.com/@mark.pelf?source=post_page---byline--db655ca50c53---------------------------------------)

Follow

27 min read

·

Apr 4, 2025

2

Impressions from Using GitHub Copilot Pro in Professional ASP.NET 8 / C# Development.

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:1400/1*yLpeGS8MP5DLDJcF2ojydQ.png)

**_Abstract: Here are my thoughts after using GitHub Copilot Pro in real-world ASP.NET 8 development over the past three months. Since technology evolves rapidly, it’s worth noting that these impressions are based on my experience as of March 2025._**

## 1 Free trial prompted me to subscribe to GitHub Copilot Pro

I have read about AI code generators and watched some demo videos in the past, but I was not convinced that they are really production-ready.

Without a reason, 3 months ago, due to a GitHub Copilot Free account being automatically activated in my **Visual Studio 2022** in my ASP.NET8 project, so-called **“ghost text”** code suggestions started to appear. I was shocked, **at moments it was a brilliant** prediction of what I was about to write/code.

For those that are unfamiliar, **“ghost text” is GitHub Copilot (GHC) suggestions** presented to the user in grayed semi-transparent text that appears without reason as a prediction by AI of what the user is to do next. If a user likes the suggested code, just confirms it, or ignores it and does his/her work.

In a few days, I decided to subscribe to the full **_GitHub Copilot PRO_**subscription to check out that tool.

## 2 Preparing for GitHub Copilot — AI usage

## 2.1 Training

I always take tools seriously, so I read manuals in advance, to be able to use tools to their full potential and be aware of limitations.

I have listened for about 10 hours of videos on GitHub Copilot, topics like “prompt engineering”, “what is context”, etc. I made my own “cheat sheet” of prompt commands and shortcut keys. After 10 hours of training, I was ready to try it in my real-life professional coding in ASP.NET 8/C#/Bootstrap/EF8/JS environment.

## 2.2 Prompt Engineering in general

In my opinion, **“Prompt Engineering” is a defeat for AI**. One of the first definitions I heard of AI systems 20 years ago was that AI would be achieved when we would be able to talk to computer systems in natural language.

Now they tell you that GHC is an AI system, but you can not really talk to it in “natural language”; you need to use “prompt engineering”, which is really **a sublanguage of natural language,** and use symbols like /, #, and @. That looks to me like some mixture of natural language and programming language. They want to sell you their AI systems they have NOW, and 5 years from now, they will probably be telling you “now we have REAL AI, no prompt engineering needed anymore”.

So, the expression “prompt engineering” is coming from the period when the only way of interacting with an AI system was via a command prompt. Then, some “art” or “science” ( I would call it “pseudo-science”) in creating commands would help you make those AI systems work better. I have read several such articles, which are all “common sense”, but since the target AI system is always a “black box”, there are **no real metrics** to show if one author’s recommendations are better than another person’s list of rules. Also, systems evolved and changed over time, so strictly speaking, those authors would need to test their recommendations against the new generation of systems again. Typically, they do not do that, but offer “common sense” rationale which is based on the perception of AI as another human intellect. And what is “common sense” for humans might not be the same for AI systems. So, I am a bit skeptical and do not fully believe all the recommendations regarding “prompt engineering” that are out there because there are no real metrics and tests against different generations of AI systems. They offer just “common sense” and anecdotal proof from a few command executions.

## 2.3. Prompt Engineering in GitHub Copilot

So, when talking about “prompt engineering” in the context of GitHub Copilot (GHC) system, that includes not only the command line interface, but also some interaction via the Visual Studio GUI. That is basically “the user interface of GitHub Copilot”.

If one plans to use GitHub Copilot efficiently, they need to get familiar with GitHub Copilot UI. So, I did, learned all the commands like /fix, /optimize, #file1.cs, Alt+/ (invoke GitHub Copilot) etc.

## 2.4 Universe of the conversation

When I was studying philosophy in high school many years ago, I was taught about the concept of the “Universe of the conversation”. In every conversation, it is implied, and topics in conversation typically refer current “Universe of the conversation”. It helps people understand what is being talked about, as certain topics and terms are assumed or taken for granted within that framework. That is a philosophy concept, defined many centuries ago, describing communication between humans. And its definition will not change as long as there are humans on Earth.

## 2.5 What is “context” in the AI world

Tech companies doing AI invented the term “context,” which has a similar meaning to above mentioned philosophy term. I would like to keep terms separate, because Tech companies like to force their definitions of what the world should look like, in an effort to sell their products and shares. Also, there will probably be a definition of AI-Context-2025 and a new definition of AI-Context-2026, and so on, as technology develops.

The way I see it, the philosophy term “Universe of the conversation” will stay the same because it describes communication between humans. “Context”, on the other hand, describes communication between humans and AI-systems, and its definition will change with different technology generations of AI-systems.

So, the current context definition as of March 2025 (you can call it AI-Context-2025 ) would be: additional information the user needs to supply to the AI system for it to understand what it is required to do.

## 2.6 What is “context” in the GitHub Copilot

In training videos for GitHub Copilot, there has been a lot of emphasis on providing the proper “context” for your requests. To me, it looks like they ask for explicitly enumerating the files that contain relevant code. I would assume that “implied context” would be your Visual Studio project/solution, but it is not, in this moment of time, at least.

Actually, there is a little GUI check-box in GitHub Copilot VS2022 you click to confirm that you want the current open document to be included in the “context” of your every request. (by the way, they call it “prompt engineering” and you are clicking GUI check boxes… maybe “GUI engineering” would be a better name 😉 ). You are also asked to enumerate relevant files by using the # prefix, like #file1.cs.

So, if you want to use GitHub Copilot efficiently, there is a certain procedure on how to use it and a recommended command prompt/GUI interface for it. So, be it. I have learned/read all the instructions, and wanted to see the AI thing generate nice code for my VS2022 project.

The way I get it, they want you to be very specific in your request and enumerate all the relevant files with code. I see it as similar to giving instructions to another programmer, with certain specificity. It is not difficult, compared to the numerous programming languages developers learn.

## 3 Impressions after 1st week

GHC is just a code-assistant tool. It is not that “intelligent,” and “smart”, but it is good with repetitive tasks and can save some time typing. It is good for re-applying a pattern you have in code again and again, but it was very, very stupid in creating an original solution.

It is a waste of time to “chat to it”, faster is to go to Google and read for yourself to solve some original problem.

But once I create a nice pattern to solve something, it can save some typing, because it learns that pattern and reapplies it again automatically.

It also tends to generate a lot of “trash code,” so a human must filter what is generated, but it is not difficult to use the “delete” button, and keep just “good snippets”.

Let’s say, based on what I have seen so far, I expect it can save me 5% of the time in typing.

## 4 Impressions after 1.5 months

**GitHub-Copilot (Gen-AI) is helpful, but not great.** It is useful sometimes, but only for local scope problems, cannot see the bigger picture.

**Sometimes it is brilliant**, but sometimes it makes too many mistakes, and when asked, gives answers in several pages of text, **wasting your time,**especially because the **verbose answers it gives are often off-topic**.

In serious problems is useless; better to read a StackOverflow article by myself and figure it out. But sometimes, it excels and generates pretty good code for repetitive tasks.

My “personal feeling” is **“it does not know it well”**, it is **“trying to guess it out**”, and since it is a machine with huge memory of millions of lines of code memorized, **guesses are sometimes brilliant, sometimes off-topic**.

## 5 Impressions after 3 months

GitHub Copilot (GHC) is a Gen-AI tool that is quite useful in tasks of limited scope.

· **GHC is sometimes brilliant.** So, yes, sometimes GHC is brilliant in predicting what you are about to code, and **prompts you with “ghost text”**that you just need to accept into your code.

· **GHC learns fast.** GHC very fast learns your style of programming (how I handle and log exceptions) better than any coworker around, and follows your style in offering you predicted “ghost text” code. I like that so much, every person around tends to have his/her own style in making logs, etc.

· **GHC dangerously adds its own style.** GHC is dangerous because it thinks it is smarter than you and will change a bit things its own way, without you noticing it. In database retrieval, in case of an exception, I was returning null. GHC prompted me with “ghost text” during coding to finish my method, and I just had a short look and accepted it. It created a bug; instead of null during an exception, it was returning an empty object, and my code elsewhere was breaking. Moral is: **read carefully the code suggestions that it is offering to you before accepting them**.

· **GHC can “generate code” but does not “write code”.** Hard to explain, but simply, GHC does not understand C# syntax well. It creates brilliant snippets of C#, but with small syntax errors. You need to **do a separate syntax check on the code you get from GHC**. That is definitely not what we are accustomed to getting from machine/automated code assistants.

· **GHC does not understand C# syntax well.** First of all, it fails on nullability like string vs string? type. You need to **check it with the compiler and polish it by yourself**. Not difficult, but you would expect to delegate exactly that kind of work to the machine/automated code assistants. I could only guess that maybe it mixes C#-.NET-Framework snippets with C#-.NET-Core code snippets.

· **GHC does not understand C# syntax well.** It inserts code snippets into your VS2022 code project, but it messes with the open/closed curly brackets of code blocks. You need to count them by yourself and add/remove what is needed. Wastes your time and sometimes creates quite a mess. Such a **disappointment that the generated code is not immediately compilation-ready**.

· **GHC does not understand C# methods/properties well.** It offers me code that looks nice, and I accept it. But C# class object does not have that method at all. It was close, its parent object has that method, so I figured that by myself. OK, it was close, and put me on the right track. But that is what machines are supposed to be for. No human can remember all the methods from maybe 10.000 C# classes that are .NET8 API that I use in my coding. I would expect the machine to help me with that. But, no, **even GHC is not sure what method is on which class**. It gives you a small homework to check that manually by yourself. **The code it gives to you will not compile, but is “close”.** It looks like **GHC hallucinates that the C# class has some method**, but it doesn’t.

· **GHC does not understand C# methods/properties well.** I am using EF8 in my VS2022 project, and have a class Customer. I started to write some access method to the Customer DB-table, and GHC offers me GetCustomer method prediction in the “ghost text”. Concept is solid, and yes, that DB-table has a Primary Key, but it is NOT called CustomerId. It looks like **GHC simply hallucinates that such a class property with that name should exist**, but it doesn’t. Predicted **code will not compile**, and I need to go check into the class Customer what is exactly the exact name of the Primary Key is. It is such a disappointment that a machine/automated code assistant, **GHC, can NOT check by itself proper property/method names**. It is just another class in the VS2022 project. So, the code snippet is conceptually close, but I need to **fix manually by myself syntax errors**. And I had such a situation 100+ times.

· **GHC does not understand C# methods/properties well.** Impression is that GHC is shallow, it does not see much more than a few pages of code, and it is trying to “guess out” what the rest of the VS2022 project looks like.

· **GHC chats tend to waste your time.** It wastes your time with its guesses. I do not have time to read more than 2 proposals of generated code. I need to do some work. After 1–2 wrong guesses, I ignore GHC and write code by myself. I tried to “chat with GHC” and sometimes after 5–7 chat interactions, it will still be as stupid as at the beginning of the conversation. Feels like talking to a non-AI chatbot on some site selling tickets. It repeats its text all the time, and **GHC has NO FOCUS on what you really need**. I tried that approach a few times, to “refine” my request in interactive chat, but it feels like talking to an idiot. I do not do that anymore, I respect and save my time and energy. I ignore GHC and do some straight coding and get results old-fashioned way. So, the conclusion is: **I give GHC 1–2 chances to say what it has to say, then ignore it so as not to waste my time, and do coding manually**.

· **GHC chats tend to waste your time.** GHC is not always a good source of information. It can be brilliant and give you better info and code samples than you hoped for. But there is **UNCERTAINITY**. It can fail. If you try to get advice on some very common topic, just a bit specific to your needs, it will **waste your time in endless chat sessions**. Better go to Google and find an article on Stack Overflow by yourself. GHC is a text generator, and that machine can generate a huge amount of text and code samples as a response to your question. **I was overwhelmed with the quantity of code samples it gives you**. For a question you ask, it gives you text and code samples that require maybe 15 minutes to read and understand. It is almost as if it is assigning you a task: read this, and then we will talk again. And that answer after answer. That GHC thing can do that forever, to coach you how HTTP works, for example, and you ask about just one header. The problem is, it **does not have focus**, **that is not what I asked**. All that is **off-topic garbage**. It is faster to go to Google and filter/open a couple of links to find the answer to your problem. So, the conclusion is: **I ask GHC and read 1–2 answers, then go to Google, not to waste my time**.

· **GHC does not follow user instructions closely.** It looks like GHC does not follow closely user’s instructions closely, it thinks it is smarter than the user, and it **follows instructions loosely, and gives what it thinks is better for the user**. So, I want HTML ASP.NET Razor form created in a certain way/style uniform across the application, but not with GHC, when I tell that, it still gives me a HTML form like from the textbook. That happened in other situations as well.

· **GHC feedback form is a waste of time.** So, software companies have a brilliant idea: they will charge for the product, but at the same time kindly ask users to participate for free in product testing. So, like many other products, some dialogs pop up asking you for your feedback. The question is whether anyone will read what you write, even if you fill the form. So many products are popping up dialogs telling you about new features and asking for 5-star evaluations of every result they produce, or even written comments. Such dialogs just clutter my workspace, and I typically have more serious things to do than to answer several questions evaluating each and every service I got. Basically, they want users in mass to help train their AI system by evaluating each answer.

· **GHC excels in small, limited scope tasks.** I needed a method to Trim() all the strings in the EF class; I wanted a generic solution. I knew Reflection was the way to go, but in one line command request, GHC generated me the perfect 30-line method. Those are situations where GHC can not be beaten by humans. It would take me time to find the proper Reflection method, read some APIs, etc. This way, I got it in 20 seconds. But, **GHC is sometimes brilliant**, sometimes useless even in such scenarios.

· **GHC fails in a bit elaborate JavaScript task.** So, I had a simple problem, limited scope, I needed a 10-liner method to wait until jQuery has been loaded, because I was using the “defer” attribute on jQuery loading. Looked like a perfect task for GHC. But I was shocked. **Even after 5 attempts, GHC was producing some JS code that is doing something else**. It could not understand what I wanted. It was just keeping generating some snippets that are seemingly related to the problem, but in reality were useless. Like you gave a task to a Junior programmer who “claims” to know some JS, and it keeps bringing you random code samples he finds on the internet, but no one is doing the simple thing you asked for. Later, I found a snippet on StackOverflow by myself. Maybe 3 clicks on Google and I found it. **GHC is so inferior sometimes**.

· **GHC produces shallow C# comments.** I was using GHC to add some comments to my methods, and the **produced comments are a bit shallow**; they do not see the big picture of what that method is trying to achieve. That is more important than line-by-line comments, now we assign this or that. It can infer from English names of methods the purposes of the method, but still not very impressive most of the time.

· **GHC doesn’t understand C# comments well.** GHC, when asked to create comments for a method, can erase some lines of real code. Be careful and read carefully what is given to you as an answer. It is a big pain, you need to manually re-read the whole method, and you can not trust GHC. It looks like **GHC does not understand syntax well, and what is a comment or not**, it sees just text. It happened to me, and I looked very carefully at why. I had some property set, and in the comment above, it was an old setting that I tested and commented out. **The GHC thing erased both of them, the code and the old code commented**. There is a probability that I have such a thing at many places in the code. So, **high risk of unwanted code manipulation** for a simple request to just add some comments. All generated commented code needs to be reviewed manually.

· **GHC “context” story doesn’t work as advertised.** It looks like there is a **“blame” game** going on, with Tech companies pointing the finger at developers for failures of the AI-Gen products. Simply, **current Gen-AI tools are not as useful as advertised in real-life situations**. But there is a huge “sales effort” to sell the current generation of AI tools, however imperfect they are, and to generate some revenue NOW. So, for failures and limitations, finger-pointing is going in the direction of users: “tools are great, you just do not know how to use them”. **Tech companies say: It is the user’s failure when AI tools fail, not true that current AI tools have problems.** One such blame game is the “context” setup for GHC.

· **GHC “context” story doesn’t work as advertised.** I am tired of reading/listening to: “you didn’t specify CONTEXT well enough”. That is just an excuse, because I did follow all the advice, and the GHC thing is still stupid and wasting my time generating useless code snippets that do not even compile, not to mention that they are off topic. I was reading about “prompt engineering” and “context”, but after my best effort, I believe that **GHC thing is not smart enough, and can’t do the job.** Let’s wait for 6 months and try newer tools. It is a waste of time to try to squeeze more from GHC at this time. So, the truth is that at the present time (March 2025), GHC is quite stupid and no amount of “context info given” can help it to solve the intermediate level task.

· **GHC can’t solve a simple Exception.** I had code throwing an exception and wanted to use GHC to solve it. I positioned on the Exception in Visual Studio and invoked GHC with /FIX. It was generating text, including a recommendation to “log more to better understand code defects”, but no specific answer. It was easy, I just copied the Exception text into Google, and 3rd link was the explanation. Not to mention that there was more text on Google on why EF9 is failing, etc. **GHC can be so inferior in regular tasks**.

· **GHC can’t enumerate properties from the plain C# class**. I was doing some LINQ and copied some objects from classes that inherit from each other. I wanted to copy all the properties that match. There were like 25 properties. I started assigning 2–3 properties and hoped for GHC to pick the pattern and insert code for the rest. No, it wouldn’t. It added a few properties out of order (which is a problem, you cannot follow which are added and which are not), then invented **names of a few properties that do not exist (hallucinate?),** and it was stacked. I was trying to issue commands from the command prompt, but it misunderstood me, inserted the whole C# class in place, etc. I was trying that several times in different places, because I have many big DTOs, so such copying is often the task. **I could not make it do it for me.** I got bored and **copied properties manually by myself**. I was tired of giving instructions to a seemingly stupid tool. Strange that **you cannot delegate such a simple task to GHC**. At times, IntelliSense is much smarter and useful than GHC.

· **GHC can’t do a little project of 4 C# files**. So, I was eager to use generative AI in my VS2022/C# project and was looking for the right opportunity. I noticed one, I was creating HTML/Razor/ASP.NET8/Bootstrap views that present some HTML tables corresponding to DB tables. It was a bit elaborate; there was breadcrumb UI inside the view, some AJAX, etc. So, I manually made one MVC Action/View for the Customers table and wanted to do completely the same for Contracts. All the same, just another DB table (corresponding to EF8 class), another EF class name with new properties. The HTML table I wanted to generate was supposed to look the same, Bootstrap style. So, typical “**follow the PATTERN in 4 files problem”.** I have seen several videos emphasizing the importance of the “context”. So **in a separate text editor, I started to write precise instructions for GitHub Copilot. I explained the task, said which file I want as a template, and marked the file name with #. I explained where the MVC model will come from, which file, etc**. I even spell-checked my small paragraph task for GHC. I spend some **time preparing task instructions in a clear manner**. Then I supplied it to the GHC. The first form it generated did NOT follow the template I explicitly mentioned. GHC thing gave me something like a textbook-looking HTML form, not one customized in Bootstrap for my application. I asked for a new generation of code files. The second one looked like the form I already created, but out of 15 DB table properties, it created only 4. Later, I figured **GHC can NOT read dependent files and is most of the time guessing property names**. It guessed right because I was disciplinarily following the same naming conventions in different EF classes, so guesses by GHC worked. I finished the file manually, by manually adding 10+ missing properties. One would **expect that such a repetitive task could be delegated to the GHC, but no, GHC can NOT do the simple repetitive job**.

· **GHC can’t do a little project of 4 C# files**. I tried again similar situation of generating some files in my VS2022/C# project based on a clear pattern-prototype file. Results are not very good, although that was the situation that was as advertised, arranged for GHC to succeed. Not complicated logic, clear name replacement needed, just a bit complicated HTML table corresponding to another DB table. But, it looks like GHC can not read EF8 properties from a 3rd file and enumerate them to create a similar-looking HTML table. Also, it **introduces a lot of errors into the generated file, by hallucinating about C# properties**. Sometimes even changes the file code without reason, so a line-by-line manual check of the generated file is needed. Also, command line chatting to GHC and asking for changes consumes time, and since the **result is not guaranteed and contains errors**, in the **end is not an efficient way of software development**.

· **GHC can’t do a little project of 4 C# files**. Looking back, **I could not be more precise regarding “context” specification**. Any person would understand the given written task and the context specified. I concluded that **GHC is just not smart enough to handle a small generation of 4 files**, even when given a very template/pattern-oriented task. I do not want to hear anymore “proper context” stories, because I put an effort to do everything right. And it is a waste of time and effort to go and ask GHC to generate files again and again and re-read every new generated code in my VS2022/C# project. I tried that, and GHC can generate another file every time you ask, and I was tired of looking into failed attempts.

· **GHC can’t do a little project of 4 C# files**. Now, when I have a similar situation to generate a new HTML view based on the template I have, **a pattern-based task, I do not ask GHC anymore**. I just use a **text editor with Find/Replace**, in my VS2022/C# project and it is the same amount of time and with **more certainty**. Because when I use Find/Replace, I know exactly what I am getting, and GHC thing would change strings, but on its own initiative, do some changes to code sometimes, so I was never sure if it changed or erased a line or two of original template code. It is boring work, but no unexpected surprises from “smart” GHC “improving” my code.

· **GHC makes silly Bootstrap mistakes**. I couldn’t remember Bootstrap class names, and I wanted to enlarge the button left and right. I asked GHC and it gave me Bootstrap class names. I applied them, and it enlarged the button top and bottom. Strange, how it can make such a mistake. I needed help exactly with all the Bootstrap CSS classes, I can not memorize them all. That is such a simple question, and GHC can not do it.

## 6 How to describe AI systems like GitHub Copilot

A typical **good definition** of something new consists of 2 parts: **1) the object/concept it is similar to, and 2) how it is different from a similar object/concept**.

So, when talking about Intelligent systems, people usually take humans as a reference value. They tend to say: AI-Gen system is on the level of a Junior programmer, but is better/worse in this or that.

But I feel that **for AI systems like GitHub Copilot (GHC), humans are not a good reference**. Humans gradually progress in their intellectual ability, they have the ability first to solve simple tasks, then more complicated and so on.

I do not know much about autism, except for Hollywood movies like “Rain Man” (1988) with Tom Cruise. But if we are to compare GHC to humans, GHC looks like that autistic character from the movie. **It can be brilliant and solve complex puzzles fast, but it can fail on a very simple task**.

I would put AI systems like GHC in their own category. Their speed and huge memory, and ability to generate a huge amount of text/code fast make them incomparable to humans. That is like an idiot that has memory and mathematical ability a million times better than any human, but is still an idiot in front of the simple problem. Can you call it stupid because it does not “write code logically” but instead probably searches millions of lines of code in its memory and finds the solution to the problem faster than you?

## 7 After the experience, how am I using GitHub Copilot now

## 7.1 GitHub Copilot makes many C# mistakes

Regarding code-assisted generation, GHC is such a huge **disappointment that it can not get the C# syntax right all the time** and **check the existence of C# properties/methods by itself**. That is definitely not what one expects to see from a machine. My feeling is that it can not reason logically at all, otherwise, it would be able to follow simple syntax rules all the time, and not create a mess with extra brackets or hallucinate about non-existing C# class methods or properties.

A big shock was when GHC was asked to add comments, it deleted the active line of code because a similar line of code was commented out. That **GHC thing does not fully understand what is “active line of code,”** otherwise it would not delete it. It seems it just sees text of some kind, and generates “look-alike” text. More like a child with huge memory and speed toying with code, than a “pair programmer” or a “peer programmer” as it is advertised.

## 7.2 When to use GitHub Copilot

So, I have coding tasks to do, and **toying with GHC was fun**, but now it is time to be serious. My time is limited, and my energy needs to be focused productively.

· **I use “ghost test” from GHC a lot**, review it, and accept suggestions when I like them. It does not waste my energy, text just pops up in my VS2022/C# project, sometimes it is useful, other times it can be interesting to see what AI thinks I should do now, and it’s **a bit of fun to read AI suggestions**.

· I select a part of code in one file in my VS2022/C# project, and ask for some changes or comments. GHC can understand such tasks well. I **focus on a limited number of lines, maybe 50, and ask for suggestions**. Sometimes GHC suggestions are useful, but many times it can not understand what I want or produces incorrect answers. It can be lost even after 3–4 iterations of chat prompts about a simple question like which specific Bootstrap CSS class I need. But, I have it all under control, and it does not waste my time much. **If it doesn’t know the answer well, I go to Google for the resolution.**

· **I use the GHC text-prompt page** to ask for the **generation of snippets or small functions with clear functionality**. GHC is great for such tasks. Here, it can be really **brilliant at times**, but sometimes it gives code snippets that are the wrong answer. **No guarantees GHC will succeed here, but if it does, it can be brilliant**.

· **I no longer try bigger changes involving 3–4 files at the same time**, since it is a pain and effort to chat with GHC to do that. Even worse, the code generated after EACH GHC intervention needs to be re-read since one is never sure what else GHC will change. **Using GHC for such tasks is a waste of my time.** Answers are at best incomplete, with many errors, like C# properties and methods that do not exist (it hallucinates?). It does not follow the given pattern closely, so I need to carefully read the generated code in my VS2022/C# project, since it can delete a line of code or add some code of its own, which is wrong in this particular case. Also, **it is time and energy-consuming to REVIEW each answer GHC provides**, and that is a machine that can generate new iterations of sample code forever. And I am just **a human, I might need maybe 10 minutes of full focus to review 300 lines of combined C#/Razor/CSS/JS, which GHC generates in 2 seconds**. And if I ask it to regenerate an answer, that is to give me a new proposed solution, I need to REVIEW it all again from the beginning.

· I was thinking, why does it hallucinate about C# properties and methods that do not exist for well-known and frequently used APIs, like related to Http context, etc.? Maybe it copied a snippet from.NET4.8 Framework, and that method is no longer there for .NET Core… But, for C# classes that are part of my VS2022 project, like EF8 classes, it looks it does not read them, it just tries to guess, there must be a Primary Key with the name CustomerId, but it is actually called differently, so I need to manually open EF8 class and copy-paste proper names of the properties.

· **I do not believe in “proper context” story**, but believe simply that **the tool GHC is not smart enough** to do serious work, and it is faster to code things straight than to endlessly chat with GHC.

· That “**proper context” story is a blame game** by companies producing AI tools, trying to blame developers for not being able to use AI products properly. So, I have learned enough about “prompt engineering” and was making a serious effort to exploit GHC to generate code for me in my VS2022/C# project, but failed. I even planned to use GHC for tasks that suit it, to follow patterns I made (like HTML tables) and generate analogous code, but no, GHC was not good enough. Altogether, **it generates more mess than useful code, for assigned pattern-based tasks involving 4 files**.

· I returned to the old method of handling UI patterns files. For example, to create “ListOfContracts” HTML (quite advanced AJAX form) based on a very similar “ListOfCustomers” UI form. I copy and rename the file. Then I use a text editor Find-Replace to modify the form in my VS2022/C# project. It is slow, but there is a certainty in progress, and no nasty surprises with missing lines of code or added unexpected lines of code. **I was thinking I would use GHC for such pattern-looking tasks, but it is more time-efficient and energy-efficient to code it directly manually.**

· **I ask GHC for help with problems, but read max 2 chat replies.** Its answers tend to be verbose, and if it knows it, I will get an answer in 2 attempts, which can be brilliant at times. If it does not give me a good answer in 2 attempts, I will go read Google for the same problem. That GHC thing can generate a huge amount of text and code samples and coach you on nice things, but I have a specific problem to solve, not time to chat endlessly. **GHC has a serious focus problem, answers are frequently off-topic.**

## 8 Marketing for AI products is very strong

Marketing for AI products by tech companies is very strong, so one must put in an effort to **stay grounded regarding the abilities of AI products** in the present moment of time.

· Marketing is strong, because Tech companies have put money into it and want some sales and revenue NOW. Even if actual AI products are not “production-ready”, they want to **sell them on a “vision story”.** Just to collect he money, marketing will create any story it needs. A good story that sells does not need to accurately reflect technical reality.

· They are talking about **“pair programming”, meaning you will not work alone but in “pair”, there will be 2 of you** working, you and an AI-guy like GHC. Maybe in the future, but as of March 2025, I see GHC as just another code-assistance tool.

· They are talking about **“peer programming”, meaning AI-guy will be equal to you in your task**. As of March 2025, GHC is still having big problems with C# syntax and hallucinates a bit of what some .NET Core API C# class precisely looks like. It can’t read the file in the VS2022 project that is there, but instead, **GHC gives a human task to check syntax and finish its work**, while it should be the opposite; humans should delegate such boring tasks to AI tools.

· To make developers feel good about themselves, there are imaginative **marketing stories** created about **“piloting and aircraft” and “having a copilot”**. At the end of the day, you are just a guy in front of a keyboard and monitor, not in a fancy airplane traveling the world. And that GHC “AI buddy” you have (as of March 2025) looks a bit autistic to me, talks much, sometimes brilliant, sometimes stupid, and better check everything he does/says because it may sound like he knows it, but can be wrong.

· Many **AI-code generators** are being demoed publicly in a bit of arranged, non-realistic scenarios. **They limit the demo to a generation of a small 50-line function**, like “factorials” or “Fibonacci numbers”. These are well-known programming textbook tasks. AI systems excel in math and might even just pull a code sample from their huge memory of code snippets. Such demos do not show how such systems would hold up when faced with real-life 300+ files of code software development projects.

## 9 Conclusion

**GitHub Copilot (GHC) (as of March 2025) is a useful tool, and I will continue to use it in my programming.** It does save me a measurable amount of time by providing code snippets and suggestions sometimes.

The technology level currently is that **GitHub Copilot (GHC) can not be trusted with a bit complicated task involving several files at the same time**. In such scenarios, results are incomplete **and not time-efficient compared to direct manual programming**.

A serious problem is that **GitHub Copilot (GHC) tends to hallucinate about C# methods and properties that do not exist**. The **GHC-generated code does not compile right away**, requiring a lot of **manual work to finish it**.

Things are evolving quickly, so the notes above are already almost outdated — apparently, a new tool called GPT-4o was released just a few days ago. It seems that AI tech companies are quietly upgrading these tools in the background, making them better and better without users receiving any explicit notice.

Some reports in the media suggest that large language models (LLMs) have reached their maximum and that by pure scaling, they are not becoming better. Maybe we will need to wait for some theoretical progress in AI science before we see real progress with AI tools.

Version of **GitHub Copilot from March 2025 is useful, though not as great as advertised**. We can expect that over time it will become better. But, still needs to be seen/verified in reality.

At the end, of course, ask for a second opinion on everything that was said in the article above.

[

AI

](https://medium.com/tag/ai?source=post_page-----db655ca50c53---------------------------------------)

[

Gen Ai Tools

](https://medium.com/tag/gen-ai-tools?source=post_page-----db655ca50c53---------------------------------------)

[

Copilot Programming

](https://medium.com/tag/copilot-programming?source=post_page-----db655ca50c53---------------------------------------)

[

Github Copilot

](https://medium.com/tag/github-copilot?source=post_page-----db655ca50c53---------------------------------------)

[

C Sharp Programming

](https://medium.com/tag/c-sharp-programming?source=post_page-----db655ca50c53---------------------------------------)
