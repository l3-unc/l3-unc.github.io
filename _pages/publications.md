---
title: "Learning from Language Lab - Publications"
layout: gridlay
excerpt: "Learning from Language Lab -- Publications."
sitemap: false
permalink: /publications/
---


### Recent Works

(For a full list of publications, see [below](#full-list-of-publications))

{% assign number_printed = 0 %}
{% for publi in site.data.publications limit:6 %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if publi.highlight == 1 %}

{% if even_odd == 0 %}
<div class="row">
{% endif %}

<div class="col-sm-6 clearfix">
 <div class="well">
  <pubtit>{{ publi.title }}</pubtit>
  <p>
  {% for topic in publi.topics %}
  {%- assign topic_style = nil -%}
  {%- if site.data.topics[topic].color != blank -%}
    {%- assign topic_style = site.data.topics[topic].color | prepend: 'style="background-color:' | append: '"' -%}
  {%- endif -%}
  <abbr class="badge" {% if topic_style %}{{topic_style}}{% endif %}><a href="/topicwise_publications#{{site.data.topics[topic].url}}" style="color:#FFFF">{{topic}}</a></abbr>
  {% endfor %}
  </p>
  <img src="{{ site.url }}{{ site.baseurl }}/images/pubpic/{{ publi.image }}" class="img-responsive" width="33%" style="float: left" />
  <p>{{ publi.description }}</p>
  <p>
    {% for person in publi.authors %}
      {%- if person.link -%}
        {%- assign link = person.link -%}
      {%- else -%}
        {%- assign link = person -%}
      {%- endif -%}
      {%- if person.show -%}
        {%- assign show = person.show -%}
      {%- else -%}
        {%- assign show = person -%}
      {%- endif -%}
      {% assign per = site.data.people | where: "name", link %}
      {%- if per[0].link -%}
        <a href="{{ per[0].link | datapage_url: 'people' }}">{{ show }}</a>
      {%- else -%}
        {{ show }}
      {%- endif -%}
      {%- if forloop.rindex > 2 -%}, {% endif %}
      {%- if forloop.rindex == 2 and forloop.length > 2 -%}, {% endif %}
      {%- if forloop.rindex == 2 -%}&nbsp;and {% endif %}
    {% endfor %}
  </p>
  <p>{{publi.venue}}, {{ publi.date | date: '%Y' }}.<br></p>
  <p>[<a href="{{ publi.links.pdf }}">pdf</a>]</p>
 </div>
</div>

{% assign number_printed = number_printed | plus: 1 %}

{% if even_odd == 1 %}
</div>
{% endif %}

{% endif %}
{% endfor %}

{% assign even_odd = number_printed | modulo: 2 %}
{% if even_odd == 1 %}
</div>
{% endif %}

<p> &nbsp; </p>

### Full List of Publications

Tags:
{% for topic in site.data.topics %}
{%- assign topic_style = topic[1].color | prepend: 'style="background-color:' | append: '"' -%}
<abbr class="badge" {% if topic_style %}{{topic_style}}{% endif %}><a href="/topicwise_publications#{{topic[1].url}}" style="color:#FFFF">{{topic[0]}}</a></abbr>
{% endfor %}

{% assign publications = site.data.publications | where: "preprint", nil | sort: 'date' | reverse %}
{% if publications.size > 0 %}
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
        topics=paper.topics
    %}
  </li>

  {% assign year_lastpaper = year_thispaper %}

{% endfor %}
</ol>
{% endif %}
