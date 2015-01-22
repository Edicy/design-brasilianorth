<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="{{ page.language_code }}">
<head>
{% include "Head" %}
{{ blog.rss_link }}
</head>
<body>
<div id="container">
	{% include "Lang" %}
	<div id="bodyContainer">
  <div class="bgLeafLeft left"></div>
  <div id="body" class="left">
   {% include "Title" %}
   {% include "Mainmenu" %}
   <div id="content" class="blog">
   {% include "Submenu" %}
    
    <h1>{% editable article.title plain="true" %}</h1>
    <div class="blogdata">{{ article.created_at | format_date:"long" }},
    <span class="green">{{ article.author.name }}</span>,
    <a href="#comments" class="none">{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></a></div>	
    
    <p class="clearfix" data-search-indexing-allowed="true">
     {% editable article.excerpt %}
     <br /><br />
     <span data-search-indexing-allowed="true">{% editable article.body %}</span>
      
     {% if editmode %}
        <div class="article-tags">
            <div class="article-tag-icon"></div>
            {% editable article.tags %}
        </div>
      {% else %}
        {% unless article.tags == empty %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% for tag in article.tags %}
                    <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                {% endfor %}
            </div>
        {% endunless %}
      {% endif %}
      
    </p>
    <div class="clearer"></div>
    <div class="hrr"></div>
    <div id="comments">
     <h2>{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>
     <div class="br"></div>
     
     {% for comment in article.comments %}
     
     <div class="edy-site-blog-comment">
     <div class="L">
      <p>
       <strong>{% removebutton %} {{ comment.author }}</strong><br />
       {{ comment.created_at | format_date:"long" }}
      </p>
     </div>
     <div class="R">
      <p>
       {{ comment.body_html }}
      </p>
     </div>
     <div class="clearer"></div>
     <div class="hr"></div>
     </div>  
     {% endfor %}   
     <div id="commentsAdd">    
      <h2>{{"add_a_comment"|lc}}</h2>
      <div class="br"></div>      
       {% commentform %}
{% unless comment.valid? %}<ul>
{% for error in comment.errors %}
<li>{{ error | lc }}</li>
{% endfor %}
</ul>{% endunless %}
        <div class="formtitle left"><strong>{{"name"|lc}}</strong></div>
        <div class="right"><input type="text" name="comment[author]" class="textbox" value="{{comment.author}}" /></div>
        <div class="clearer"></div>	
         
        <div class="formtitle left"><strong>{{"email"|lc}}</strong></div>
        <div class="right"><input type="text" name="comment[author_email]" class="textbox" value="{{comment.author_email}}" /></div>
        <div class="clearer"></div>	
         
        <div class="formtitle left"><strong>{{"comment"|lc}}</strong></div>
        <div class="right"><textarea rows="6" cols="50" name="comment[body]">{{ comment.body }}</textarea></div>
        <div class="clearer"></div>
        <div class="add right"><input type="submit" class="submit" value="{{"submit"|lc}}" /></div>
        <div class="clearer"></div>
       {% endcommentform %}
     <!-- // commentsAdd -->
     </div>
    </div>
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