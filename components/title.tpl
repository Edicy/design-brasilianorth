   <div id="title"{% if site.search.enabled %} style="width: 300px"{% endif %}>
    <div class="left title"><h1 class="clearfix">{% editable site.header %}</h1></div>

    <div class="clearer"></div>
   </div>
{% if site.search.enabled %}
<div id="search">
<form action="" class="edys-search">
<div><input type="text" id="onpage_search" class="edys-search-input" placeholder="{{ "search"|lc }}" /><input type="submit" class="search-submit" value="" /></div>
</form>
</div>
{% endif %}
<div class="clearer"></div>