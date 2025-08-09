---
title: Crew
description: The people who keep the kotatsu warm and the shichirin sizzling.
permalink: /crew/
layout: default
---

<p class="brand-wrapper">
  <img src="{{ site.baseurl }}/assets/img/community_ico.png" alt="Community" class="brand-mark">
</p>

**Tabete** is a circle of consultants and friends who believe work is richer when it feels like an open table.

<ul class="crew">
{% for author in site.data.authors %}
  <li><a href="{{ '/author/' | append: author[0] | append: '/' | relative_url }}">{{ author[1].name }}</a></li>
{% endfor %}
</ul>

---

Have a project you'd like to bring to the table?
Or maybe collaborate on a tasty idea?
Let's connect!
Info at tabete.se or @tabete‑community on GitHub
