---
title: Crew
description: The people who keep the kotatsu warm and the shichirin sizzling.
permalink: /crew/
layout: default
---

<p class="brand-wrapper">
  <img src="{{ site.baseurl }}/assets/img/community_ico.png" alt="Community" class="brand-mark">
</p>

**Tabete** is a circle of friends, consultants and tinkerers who believe work is
richer when it feels like an open table.

<ul class="crew">
{% for author in site.data.authors %}
  <li><a href="{{ '/author/' | append: author[0] | append: '/' | relative_url }}">{{ author[1].name }}</a></li>
{% endfor %}
</ul>

Pull up your skewer, throw something on the grill and let's see what flavours we invent next.

---

Have a project you'd like to roast over our coals?
Or maybe collaborate on something delicious?
Let's connect!
Info at tabete.se or @tabete‑community on GitHub
