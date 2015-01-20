   <div id="mainmenu">
    <ul>
     {% unless site.root_item.hidden? %}<li><a href="{{ site.root_item.url }}"{% if site.root_item.current? %} class="active"{% endif %}>{{site.root_item.title}}</a></li>{% endunless %}
     {% for item in site.visible_menuitems %}
     <li><a href="{{ item.url }}"{% unless item.translated? %} class="untranslated fci-editor-menuadd"{% endunless %}{% if item.selected? %} class="active"{% endif %}>{{ item.title }}</a></li>
     {% endfor %}
     {% if editmode %}{% if site.hidden_menuitems.size > 0 %}<li>{% menubtn site.hidden_menuitems %}</li>{% endif %}    
     <li>{% menuadd %}</li>{% endif %}      
    </ul>
   </div>