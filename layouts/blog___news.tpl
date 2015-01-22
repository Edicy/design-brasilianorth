<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{{ page.language_code }}" lang="{{ page.language_code }}">
<head>
{% include "Head" %}
{{ blog.rss_link }}
</head>
<body>
<div id="container" data-search-indexing-allowed="false">
	{% include "Lang" %}
	<div id="bodyContainer">
  <div class="bgLeafLeft left"></div>
  <div id="body" class="left">
   {% include "Title" %}
   {% include "Mainmenu" %}
   <div id="content" class="blog">
   {% include "Submenu" %}
     {% if tags %}
            <div class="blog tagged-list-header">
                <div class="header-tag-icon"></div>
                {% if tags == empty %}
                    {{ "no_posts_tagged" | lc }}
                {% else %}
                    {{ "posts_tagged" | lc }} '{{ tags | sort:"name" | map:"name" | join:"', '"}}'.
                {% endif %}
            </div>
        {% endif %}
     {% addbutton class="add-article" %}
     
    {% for article in articles %}
    <h1><a href="{{ article.url }}" class="none">{{ article.title }}</a></h1>
    <div class="blogdata">
     {{ article.created_at | format_date:"long" }},
     {{ article.author.name }},
     <a href="{{ article.url }}#comments" class="none">{{"comments_for_count"|lc}}: {{ article.comments_count }}</a>
    </div>
    <p class="clearfix content-hyphenate">{{ article.excerpt }} <a href="{{ article.url }}">{{"read_more"|lc}}</a></p>
    <div class="hr"></div>
    {% endfor %}	
   </div>
  </div>
  <div class="bgLeafRight left"></div>
  <div class="clearer">
   <div class="clearerWhite"></div>
  </div>
	</div>
{% include "Footer" %}
</div>
  {% include "JS" %}
</body>
</html>