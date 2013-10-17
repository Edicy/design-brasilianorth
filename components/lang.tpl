	<div id="lang">
  {% if site.has_many_languages? %}
  {% for language in site.languages %}
   <a href="{{ language.url }}" {% if language.selected? %}class="active"{% endif %}>{{ language.title }}</a>
  {% endfor %}
  {% endif %}
                {% if editmode %}{%languageadd%}{% endif %}
	</div>