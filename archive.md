---
layout: page
title: Archive
permalink: /archive
---

# Blog

<div class="page-bg-shadow">
  <section class="archive-post-list">
    {% for post in site.posts %}
        {% assign currentDate = post.date | date: "%Y" %}
        {% if currentDate != myDate %}
            {% unless forloop.first %}</ul></div></div>{% endunless %}
            <div class="archive-post-year">
              <h1>{{ currentDate }}</h1>
              <div class="archive-post-articles"><ul>
            {% assign myDate = currentDate %}
        {% endif %}
        <li>
          <a href="{{ post.url }}" class="archive-link">
            <span class="archive-tag">{{ post.date | date: "%B %-d, %Y" }}</span>
            <span class="archive-title">{{ post.title }}</span>
          </a>
        </li>
        {% if forloop.last %}</ul></div></div>{% endif %}
    {% endfor %}
  </section>
</div>

<!-- Via http://chris.house/blog/building-a-simple-archive-page-with-jekyll/ -->
