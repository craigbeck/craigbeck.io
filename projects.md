---
layout: page
title: Projects
---
{% for project in site.data.projects %}
## [{{ project.name }}]({{ project.url }})

{{ project.excerpt }}
{% endfor %}
