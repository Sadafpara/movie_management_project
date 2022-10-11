<p> This is my template rendered page</p>
<table>
<tr>
<th>Title</th>
<th>Year</th>

</tr>

<!-- A jinja2 tag (statement), has been imported with the render template, used for for-loops -->
{% for movie in movies_data %} 
<tr>

    <td>{{movie[1]}}</td>
    <td>{{movie[2]}}</td>
</tr>
{% endfor %}
</table>