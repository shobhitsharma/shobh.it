---
layout: page
title: Projects
categories: []
tags: []
status: publish
type: page
published: true
meta: {}
---

# My Projects

<div id="my-repos" class="posts-list">
  {% fetch_projects data from url https://api.github.com/users/shobhitsharma/repos %}
  {% for repo in data %}
    <article class="post" itemscope="" itemtype="http://schema.org/BlogPosting">
      <div class="post-details">
        <h2 itemprop="name headline">
          <a href="'+repo.html_url+'" target="_blank"> {{ repo.name }}</a>
        </h2>
        <p class="post-excerpt">{{ repo.description }}</p>
        <p class="post-meta">
          <time>{% assign date_format = site.minima.date_format | default: "%b %-d, %Y" %}
          {{ repo.updated_at | date: date_format }}
          &nbsp; • &nbsp; <span class="post-tags"><a class="tag">{{ repo.language }}</a></span>
          </time>&nbsp; • &nbsp; {{ repo.stargazers_count }} stars / {{ repo.forks_count }} forks
        </p>
      </div>
    </article>
  {% endfor %}
</div>
