---
title: Crew
description: Independent consultants sharing a brand, a community and a way of working.
permalink: /crew/
layout: default
---

<p class="brand-wrapper">
  <img src="{{ site.baseurl }}/assets/img/mrtabete-wide/engarde.png" alt="Community" class="brand-mark">
</p>

**Tabete** is a circle of independent consultants and friends who believe work is richer when it feels like an open table.

<ul class="crew" id="crew-list">
{% for author in site.data.authors %}
  <li><a href="{{ '/author/' | append: author[0] | append: '/' | relative_url }}">{{ author[1].name }}</a></li>
{% endfor %}
</ul>

<script>
// Randomize crew list order
(function() {
  const list = document.getElementById('crew-list');
  const items = Array.from(list.children);
  items.sort(() => Math.random() - 0.5);
  items.forEach(item => list.appendChild(item));
})();
</script>

---

## About Tabete

Tabete is a collective of experienced hands who build and improve delivery pipelines, internal platforms and the developer experience around them.
We share a brand, a community and a set of standards.
We are each our own business but we work closely together, develop together and where it fits, collaborate directly on client work.

We are owned and run by the people doing the work: no external investors, no growth-at-all-costs mandate, no juniors to bill out.
That gives us freedom to be honest with each other, maintain standards without politics and orient ourselves toward craft rather than scale.

For clients, this means the senior person you engage is running their own business and has chosen to take on your challenge.
They're connected to other experienced people they trust and consult with regularly.
You get accountability and reach at the same time.

Have a project you'd like to bring to the table? [Get in touch →](/work-with-us/)

---

## How we work together

We keep just enough structure to stay intentional - enough to avoid drifting, not so much that it becomes overhead.

**Making decisions:** ask two people (the ones most likely to disagree) in a public setting (for instance Discord). For major decisions like bringing someone new into the circle, we need unanimous agreement.

**Tooling:** Notion for docs, GitHub for the site, Discord for day-to-day conversation and the Orbiters channel.

**Shared expectations:** We maintain standards of communication, honesty with clients and mutual respect to ensure a healthy and productive environment.

**Client-first approach:** We put the client's interest ahead of protecting our own image or pipeline of work; sometimes that means saying “this isn't a good fit” or pointing you somewhere else.
