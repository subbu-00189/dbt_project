{% set a='hello' %}
{{a}}

{% set a = [123,'sri',false]%}
{%for i in a %}
{{i}} values of list
{%endfor%}
values of list like
{{a[0]}}
{{a[1]}}
{{a[2]}}

{% set b ={
    "name":"satay",
    "age":24
}%}
{{b.name}}
{{b.age}}
values of dict like
{{b["age"]}}
{{b["name"]}}


{% set temp=80%}
temp is 80
{% if temp>70%}
temp is  {{temp}}
{%endif%}
