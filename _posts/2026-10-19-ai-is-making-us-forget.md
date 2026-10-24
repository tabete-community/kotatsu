---
title: "AI revolution is steering us away from the software engineering evolution"
description: |
  Software engineering finally learned that the hard part is not writing code. It is changing code safely. AI is now making it dangerously easy to forget that.
date:   2026-10-19
layout: post
tags:   [continuous-delivery, devex, llm, software-engineering]
author: albert
banner: /assets/banners/pexels-pavel-danilyuk-8439082.jpg
---

# AI revolution is steering us away from the software engineering evolution

We spent 30 years evolving the practices and disciplines around how to change software safely. AI has been revolutionizing software development, making it dangerously easy to forget that.

## The bigger context

AI has obvious and serious problems that have nothing to do with software engineering: enormous electricity demand, water use, labour questions, copyright, surveillance, the concentration of power in a few vendors, etc.

But this post is about another cost: what happens inside software organisations when we treat LLM output as a substitute for the practices we spent decades building. Software development did not become better just because we learned to write more code. It became better because we learned how to make change safe: in small increments, with fast feedback, shared ownership, automated verification and the ability to recover when we made mistakes.

The promise of LLM-assisted development is that we can produce software faster. The danger is that **we are again confusing *output* with *progress***. LLMs make it cheap to generate code, tests, documentation and pull requests that all look good at a glance. But if we do not preserve testing, small batches, traceability and ownership, we are not accelerating software engineering. We are reverting to an earlier, worse version of it: more code, more handoffs, more incidents and suboptimal outcomes.

## Learning from history

Software engineering has evolved through a series of movements and practices, each addressing specific challenges and improving the safety and reliability of making changes. Each step added a control or feedback mechanism. With structured methods and version control we made code comprehensible, traceable and reviewable. Our understanding and accountability improved significantly.

With the **Agile** movement we learned to deliver value incrementally, respond to change quickly and prioritize collaboration and communication. This further improved our ability to manage change safely and effectively.

Extreme Programming (XP) emerged as a disciplined Agile approach built around short feedback loops, simplicity and technical practices such as pair programming, continuous testing, and refactoring. Test-Driven Development (TDD) made expected behaviour explicit before implementation. Tests as design tools, not afterthoughts.

With our sights on making software development an actual science where we could start to prove that the code we produced would work beforehand, instead of relying on testing and hope after implementation, we continued with Continuous Delivery practices to make releases routine and low-risk. The entire DevOps thing emerged to connect development with operations, ensuring that teams owned what they ran and that production feedback mattered. And lastly, platform engineering and DevEx to **make the safe path the easy path**.

> Instead of continuing the *evolution* of software engineering, the *revolution* brought by LLMs risks undermining the hard-won practices and safeguards that make software development reliable and sustainable.

Don't get me wrong, LLMs are not inherently evil. *"Guns don't kill people; people kill people."* Similarly, LLMs don't create bad software on their own; they amplify the intentions and practices of the humans using them.

An LLM can be a useful assistant: a rubber duck that suggests an API, drafts a test, explains an unfamiliar codebase or produces a first version of a prototype. The problem begins when organisations treat generated material as finished engineering. The model can produce code that runs, tests that pass, documentation that sounds authoritative and apps that look functional - without any of those things being correct, secure, maintainable or understood by the team.

### The prototype trap

I've been in the industry long enough to know that one of the big fears of people working with software is that the prototype we've created will be mistaken for the final product, leading to fragile systems and hidden technical debt.

A prototype is useful because it is disposable. It helps a team learn whether an idea makes sense. The danger is when a convincing prototype is mistaken for a maintainable product: no tests worth trusting, no operational model, no security review, no clear ownership and no understanding of what will break under real load. The purpose of a prototype is to learn quickly and cheaply, not to serve as the foundation for a long-lived system.

Organisations have always struggled with distinguishing between prototypes and production-ready systems. But with rapid prototyping enabled by LLMs, the situation is getting dangerous: 1) the prototypes look much more finished and 2) anyone can make them. The lack of experience in understanding the purpose of prototypes creates a perfect storm for fragile systems and hidden technical debt.

### And that's not all

**Volume without comprehension.** The amount of code being generated and approved far exceeds what any individual could fully understand. People approve code they could not have written or debugged. Without strong automated verification and careful review, mistakes slip through at scale never seen before.

**Tests as theatre.** Generated tests may assert implementation details rather than behaviour or pass while missing meaningful cases. LLM-assisted development can create the illusion of safety without actually verifying correctness.

**Loss of tacit knowledge.** If juniors learn by asking a model rather than reading, debugging and being reviewed, the organisation loses its future senior engineers. Over time, this can erode the collective expertise and problem-solving ability of the industry as a whole.

**Vendor-shaped systems.** Code and workflows gradually assume a particular assistant, model or platform. If a certain LLM coding assistant (Copilot, Claude Code, etc) was used to create the initial code, future changes may implicitly depend on that model's behavior, making it harder to switch tools or maintain the system independently. This is not hypothetical: LLM vendors can change model behaviour, deprecate APIs, alter agent capabilities or discontinue products with little warning. The new mantra - "AI will maintain code written by AI" - is a dangerous assumption.

## What does the research say?

*DORA’s 2026* research, *The ROI of AI-assisted Software Development*, shows that LLMs accelerate the environment it enters: with mature platforms and streamlined delivery pipelines, they can scale value delivery; with manual testing, bureaucracy or fragmented data, they can accelerate technical debt and maintenance costs. [[1](https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development)]

> *"Artificial intelligence (AI) serves as a powerful amplifier in software development. It magnifies the strengths of high-performing organizations and the dysfunctions of struggling ones." [[1](https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development)]*

*GitClear's code-quality research* analysed 211 million changed lines from 2020–2024 and found rising duplication and short-term churn, while "moved lines" fell sharply. The moved lines is interesting because it indicates a decline in refactoring activity, suggesting that more changes are being made as new code rather than improving existing code. Now, GitClear’s data is correlational, not a controlled experiment. But the direction of the trend supports a worrying possibility: when generating another version of something becomes nearly free, teams add duplicates and revisions faster than they refactor and consolidate [[2](https://www.gitclear.com/ai_assistant_code_quality_2025_research)].

![](/assets/img/blogs/ai-moved-lines.png)
*Figure 1: From GitClear AI Code Quality Research v2025.2.5. [[2](https://www.gitclear.com/ai_assistant_code_quality_2025_research)]*

> *"Developers have arrived at a point in history where it has never been easier to write half a line, press tab and, and presto! New lines of code to maintain." [[2](https://www.gitclear.com/ai_assistant_code_quality_2025_research)]*

I do not claim LLMs *cause* every quality decline. They are, however, significant amplifiers of existing practices and weaknesses.

### The central mistake: optimising the wrong metric

“Lines of code written” was never a good measure of engineering. Neither is “PRs merged”, “tickets closed” or “AI suggestions accepted”. Those are measures of activity. Software engineering is measured by whether we can safely deliver valuable change, understand the system, operate it and change it again next month.

> A code base should be easy to maintain months and years after its initial development.

What should we measure, then, if not lines of code or tickets closed? The answer is the aspects of software engineering that truly reflect value and safety: lead time for a *safe* change, change failure rate, time to restore, on-call load, review quality, test mutation strength, production incident recurrence, and maintainability.

> *"We don't measure AI by the code it writes but by the bottlenecks it clears." [[1](https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development)]*

Looking at the metrics DORA defines, in my experience, it's easy to measure *"Lead time for changes"* and the *"Deploy frequency"* metrics, but harder to capture the full impact on *"Change failure rate"*, *"Recovery time"* and *"Rework rate"*, especially in an embedded context. When adopting LLM-assisted development the focus should not only be on the easily measurable metrics, but the ultimate value should be judged by its impact on the full range of metrics and thus makes it important to somehow measure all five metrics.

![](/assets/img/blogs/ai-value.png)
*Figure 3: The value model from DORA research. [[1](https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development)]*

## Principles for LLM-assisted Development

The answer is not to ban LLMs. It is to make LLM-assisted development subject to the same disciplines that made continuous delivery work.

If you adopt LLM-assisted development, I suggest following these principles:

- **Small batches still win.** Generate less per change; review smaller diffs. Continuous delivery principles still apply. Make it easy for a human reviewer to understand and verify each change. Humans are ultimately accountable. The author and reviewer must be able to explain the change.
- **Document your intent, not the implementation.** Make sure that you keep the documentation relevant. I've seen too many cases where documentation is bloated and in many cases duplicated in the same README file, just because AI kept adding new sections. Always review and clean up documentation to ensure it accurately reflects the current state of the code.
- **Tests come from intended behaviour.** A generated test must encode a requirement, not merely execute generated code. TDD is still an important practice to ensure that the code meets its intended behaviour and not just that it executes with no errors.
- **Let the human lead.** LLMs should assist, not replace, human judgment. Ensure that critical decisions, especially those affecting safety and maintainability, are made by humans who understand the context and implications. This is true on all levels, even in day-to-day coding tasks like implementating a new function or refactoring existing code.

## Closing

We did not adopt agile, TDD, CI/CD, DevOps and platform engineering because they produced more code. We adopted them because they helped us build systems we could understand, operate and safely change. If AI makes us produce more changes than we can verify, review, operate or comprehend, then it has not advanced software engineering. It has merely made us faster at repeating old mistakes.

The measure of AI in software development should not be how much code it helps us write. It should be whether it helps us build better systems - and whether, a year later, we still understand them.

Remember, AI may appear intelligent, but it does not bring judgement, accountability or a stake in the system. It can generate code and explanations that look convincing while being subtly wrong. That is why the disciplines we spent decades building matter more, not less, in an LLM-assisted world.

## Links and citations

1. DORA 2026 - The ROI of AI-assisted Software Development: [https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development](https://cloud.google.com/resources/content/dora-roi-of-ai-assisted-software-development)
2. AI Copilot Code Quality Evaluating 2024's Increased Defect Rate via Code Quality Metrics: [https://www.gitclear.com/ai_assistant_code_quality_2025_research](https://www.gitclear.com/ai_assistant_code_quality_2025_research)

<!-- Photo by Pavel Danilyuk: https://www.pexels.com/photo/a-scientist-testing-a-device-8439082/ -->
