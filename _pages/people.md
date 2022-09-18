---
title: "GRAIL Lab - Team"
layout: gridlay
excerpt: "GRAIL Lab: Team members"
sitemap: false
permalink: /team/
---

# Group Members


## Principal Investigator
{% assign pis = site.data.people | where: "title", "pi"  %}
{% include people.html people = pis %}
<div class='row'></div>

## PhD Students 
{% assign phds = site.data.people | where: "title", "phd"  %}
{% include people.html people = phds %}
<div class='row'></div>

## Masters and Bachelors Students
{% assign masters = site.data.people | where: "title", "masters"  %}
{% assign bachelors = site.data.people | where: "title", "bachelors"  %}
{% include people.html people = masters %}
{% include people.html people = bachelors %}
<div class='row'></div>


## Alumni

{% assign number_printed = 0 %}
<ul>
{% for member in site.data.alumni %}
<li>
  {% if member.link != "" and member.link != nil %}
    <a href="{{ member.link }}">{{ member.name }}</a> ({{ member.info }}), {{ member.duration.start }} - {{ member.duration.end }}
  {% else %}
    {{ member.name }}({{ member.info }}), {{ member.duration.start }} - {{ member.duration.end }}
  {% endif %}
</li>
{% endfor %}
</ul>