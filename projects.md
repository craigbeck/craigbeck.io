---
layout: page
title: Projects
---
{% for project in site.data.projects %}
## [{{ project.name }}]({{ project.url }})

{{ project.excerpt }}
{% endfor %}

## Contributions
{% for project in site.data.contributions %}
[{{ project.name }}](https://github.com/{{ project.name }}/commits?author=craigbeck)
{% endfor %}
