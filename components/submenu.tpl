    {% for item in site.all_menuitems %}{% if item.selected? %}
{% if editmode %}
<div class="submenu"><ul>{% for level2 in item.visible_children %}
    <li><a href="{{ level2.url }}"{% unless level2.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if level2.selected? %} class="active none"{% endif %}>{{ level2.title }}</a></li>
    {% endfor %}
  <li>{% menubtn item.hidden_children %}</li>
    <li>{% menuadd parent="item" %}</li>
    </ul></div>
{% else %}
{% if item.children? %}
<div class="submenu"><p>{% for level2 in item.children %}
    <a href="{{ level2.url }}"{% if level2.selected? %} class="active none"{% endif %}>{{ level2.title }}</a>
    {% endfor %}
    </p></div>
{% endif %}
{% endif %}
{% endif %}{% endfor %}