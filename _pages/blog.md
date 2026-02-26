---
title: blog & updates
header_image: assets/img/mrtabete/wave.png
description: Quick notes & stories from around the kotatsu.
permalink: /blog/
layout: default
tag: [tabete, kotatsu, shichirin]
---

<div class="blog-index">

  <main class="blog-list">
    <h2>Posts</h2>
    {% for post in site.posts %}
      <article class="post-card">
        <h3><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h3>
        <small>{{ post.date | date: "%-d %b %Y" }}</small>

        <a class="thumb" href="{{ post.url | relative_url }}">
          {% if post.banner %}
            <img src="{{ post.banner | relative_url }}" alt="{{ post.title }} thumbnail">
          {% endif %}
        </a>
      </article>
    {% endfor %}
  </main>

  <aside class="blog-tags">
    <h2>tags</h2>
    <p class="tag-cloud">
      {% assign all_tags = site.tags | sort %}
      {% for tag in all_tags %}
        <a href="/tag/{{ tag[0] | slugify }}/">{{ tag[0] }}</a>{% unless forloop.last %} | {% endunless %}
      {% endfor %}
    </p>
    <h2>authors</h2>
    <p class="tag-cloud">
      {% assign authors = site.data.authors | sort %}
      {% assign first = true %}
      {% for author in authors %}
        {% assign id          = author[0] %}
        {% assign authorPosts = site.posts | where: "author", id %}
        {% if authorPosts.size > 0 %}
          {% unless first %}| {% endunless %}
          <a href="/author/{{ id }}/">{{ id }}</a>
          {% assign first = false %}
        {% endif %}
      {% endfor %}
    </p>

  </aside>

</div>
