---
title: "Learning from Language Lab - Team"
layout: gridlay
excerpt: "Learning from Language Lab: Team members"
sitemap: false
permalink: /team/
---


## Principal Investigator
{% assign pis = site.data.people | where: "title", "pi"  %}
{% include people.html people = pis %}
<div class='row'></div>

## Graduate Students 
{% assign phds = site.data.people | where: "title", "phd"  %}
{% include people.html people = phds %}
{% assign masters = site.data.people | where: "title", "masters"  %}
{% include people.html people = masters %}
<div class='row'></div>

## Undergraduate Students
{% assign bachelors = site.data.people | where: "title", "bachelors"  %}
{% include people.html people = bachelors %}
<div class='row'></div>


## Alumni


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
