+++
title = "Shadow Theory: Why AI Prompting Is About Perspectives"
slug = "shadow-theory-why-ai-prompting-is-about-perspectives"
date = 2026-06-14
description = "This post introduces Shadow Theory: a mental model for AI prompting that treats prompts as perspectives shaping what the model sees. It explains why better results often come from changing the angle of analysis rather than simply adding more instructions or context."

[taxonomies]
tags = ["AI", "CTO"]

[extra]
banner = "/images/banners/shadow-theory-why-ai-prompting-is-about-perspectives.png"
+++

I've had AI produce some of the most impressive technical work I've ever seen.

I've also had it completely miss obvious problems.

Sometimes the difference was not additional context.

Sometimes it wasn't a better prompt.

Sometimes it wasn't even more information.

The breakthrough came when I stopped thinking about prompts as instructions and started thinking about them as perspectives.

The same codebase.

The same design.

The same requirements.

A different perspective.

A completely different result.

That observation led me to a mental model I now use constantly when working with AI.

I call it **Shadow Theory**.

The valuable skill, I've come to believe, is not prompt engineering.

It's **perspective engineering**: the ability to deliberately examine a problem from different angles.

## The Object, the Light, and the Shadow

Imagine a dark room.

In the center sits a complex object.

That object represents reality.

A codebase.

A software architecture.

A deployment strategy.

A product design.

A business process.

The object contains everything: requirements, assumptions, constraints, tradeoffs, edge cases, hidden problems, and future risks.

Now place a light somewhere in the room.

The object casts a shadow.

That shadow is what the AI sees.

In Shadow Theory:

- **The Object** is the real problem.
- **The Light** is the prompt.
- **The Shadow** is the representation of the problem that the AI reasons about.

Move the light and the shadow changes.

The object remains exactly the same.

The quality of the result often depends less on the amount of information provided and more on the shadow being cast.

The AI doesn't necessarily need more information.

It may simply need a different perspective.

## The Problem with Floodlighting

One of the recurring jokes in AI prompting is:

> Make no mistakes.

Everyone knows it doesn't work.

The instruction sounds useful, but it contains no perspective.

It doesn't tell the AI what kind of mistakes matter or where to focus its attention.

In Shadow Theory, this is equivalent to floodlighting the room.

Light is coming from every direction.

Nothing stands out.

No shadow has contrast.

The result isn't a better shadow.

The result is no shadow at all.

![shadow theory - floodlighting no shadow](/images/posts/shadow-theory-floodlighting-no-shadow.png)

## High-Contrast Shadows

The best AI results I've obtained came from deliberately casting specific shadows.

### The Maintainability Shadow

> What parts of this design are becoming API contracts that will be difficult to change?

This reveals accidental contracts, backward compatibility concerns, hidden coupling, and architectural decisions that may limit future evolution.

Many design decisions look perfectly reasonable today. The problem is that once customers, integrations, scripts, or other systems begin depending on them, changing them becomes expensive.

### The Customer Shadow

> What assumptions in this design will surprise or frustrate users?

This reveals usability issues, unexpected behaviors, product friction, and future support burden.

### The Attacker's Shadow

> Assume I have a valid user account. How do I become an administrator?

This reveals privilege escalation paths, authorization flaws, trust boundary violations, and credential exposure risks.

The system never changed.

The shadow did.

![shadow theory - high-constrast detailed shadow](/images/posts/shadow-theory-high-constrast-detailed-shadow.png)

## The Multiple Shadows Principle

No single shadow completely describes an object.

Every shadow is incomplete.

Every shadow is biased by the position of the light.

This is where many AI conversations go wrong.

People ask:

> Analyze this system completely.

But there is no such shadow.

There are only perspectives.

Security.

Performance.

Maintainability.

Customer impact.

Each perspective reveals something different.

None of them are wrong.

They're incomplete.

The goal is not to find the perfect prompt.

The goal is to cast enough shadows from the angles that matter to reconstruct the shape of the object.

![shadow theory - multiple shadows different angles](/images/posts/shadow-theory-multiple-shadows-different-angles.png)

## Why Agent Skills Work

This mental model also explains why custom instructions and agent skills are useful.

A good skill is not a magic intelligence upgrade.

A good skill is a reusable way to apply a perspective.

It says:

> When we're operating in this context, examine the problem from this angle, apply these conventions, and present the results in this format.

Agent skills eliminate repetition, preserve context, and encode patterns that have proven useful.

They make it easier to apply the same perspective consistently.

## Why There Will Never Be a "Think of Everything" Skill

One conclusion I've reached is that there can never be a useful universal skill that says:

> Think of everything.

Or:

> Make no mistakes.

Or:

> Never miss anything.

Those are not shadows.

They're floodlights.

They attempt to illuminate the entire room from every direction simultaneously.

The result is not perfect reasoning.

The result is reduced contrast.

Good skills are always contextual.

They work because they apply a specific perspective to a specific class of problems.

A security skill applies an attacker's perspective.

A maintainability skill applies a maintainer's perspective.

A documentation skill applies a reader's perspective.

A support skill applies a customer's perspective.

Each one reveals different details.

None of them eliminate the need for judgment.

## Perspective Engineering

One thing I find amusing is the recurring prediction that AI will eventually remove the need for developers to think.

My experience has been exactly the opposite.

AI dramatically reduces the cost of execution.

What it doesn't do is remove responsibility.

The developer still decides:

- Which perspective matters?
- Which constraints are important?
- Which risks are acceptable?
- Which assumptions need validation?
- Which shadow should be cast next?

AI can help explore a perspective.

It cannot decide whether that perspective is the right one.

That remains a human responsibility.

Before AI, exploring ten different perspectives on a design was expensive.

Each investigation required time, prototypes, analysis, meetings, experiments, or implementation work.

Today, AI can help explore those perspectives in minutes.

What AI changes is not the process.

It changes the cost.

The bottleneck has moved.

The scarce resource is no longer the ability to generate an answer.

The scarce resource is knowing which question to ask next.

> The valuable skill is knowing where to move the light.

## Conclusion

The biggest misconception about AI is that success comes from finding the perfect instruction.

In reality, effective prompting is often about choosing the right perspective.

The AI doesn't necessarily need more words.

It doesn't necessarily need more context.

It may simply need a different shadow.

The next time an AI response feels shallow, resist the urge to ask a bigger question.

Instead, move the light.

The object hasn't changed.

The shadow has.