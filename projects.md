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

<div id="my-repos" class="posts-list"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
$.ajax({
  url: "https://api.github.com/users/shobhitsharma/repos",
  jsonp: true,
  method: "GET",
  dataType: "json",
  beforeSend: function() {
    $('#my-repos').empty().append('<h3>Fetching ...</h3>');
  },
  error: function (xhr) {
    $('#my-repos').empty().append('<h3>'+xhr.responseText+'</h3>');
  },
  success: function(repos) {
    $('#my-repos').empty();
    repos.sort(function (a,b) {
      return new Date(b.updated_at) - new Date(a.updated_at);
    }).forEach(function (repo) {
      if (!repo.fork) {
        $('#my-repos').append(
          '<article class="post" itemscope="" itemtype="http://schema.org/BlogPosting">' +
            '<div class="post-details">' +
              '<h2 itemprop="name headline">' +
                '<a href="'+repo.html_url+'" target="_blank">'+repo.name+'</a>' +
              '</h2>' +
              '<p class="post-excerpt">'+repo.description+'</p>' +
              '<p class="post-meta">' +
                '<time>'+new Date(repo.updated_at).toLocaleString('en-GB')+
                '&nbsp; • &nbsp; <span class="post-tags"><a class="tag">'+repo.language+'</a></span>' +
                '</time>&nbsp; • &nbsp; '+ repo.stargazers_count + ' stars / '+ repo.forks_count + ' forks'+
              '</p>' +
            '</div>' +
          '</article>'
        );
      }
    });
  }
});
</script>
