---
title: "Learning and Language Lab - Publications"
layout: gridlay
excerpt: "Learning and Language Lab -- Publications."
sitemap: false
permalink: /topicwise_publications/
---

{% for topic in site.data.topics %}
<h3 id="{{topic[1].url}}"><a href="#{{topic[1].url}}" style="color:#000000">{{topic[0]}}</a></h3>
{% assign publications = site.data.publications | where_exp: "item", 'item.topics contains topic[0]' | sort: 'date' | reverse %}
{% assign year_lastpaper = nil %}
{% for paper in publications %}
{% assign year_thispaper = paper.date | date: '%Y' %}

{% if year_lastpaper != year_thispaper %}
{% unless forloop.first %}
</ol>
{% endunless %}
<h3>{{ year_thispaper }}</h3>
<ol reversed start="{{ forloop.rindex }}">
{% endif %}

<li>
{% include paper.html
    title=paper.title
    authors=paper.authors
    venue=paper.venue
    date=paper.date
    links=paper.links
%}
</li>

{% assign year_lastpaper = year_thispaper %}
{% endfor %}
</ol>
{% endfor %}