{%  macro function1(x) %}

CASE WHEN to_timestamp({{x}}) < current_date() then 'PAST'
ELSE 'FUTURE'
END

{% endmacro %}


{%  macro get_season(x) %}
CASE
WHEN MONTH(To_timestamp({{x}})) in (12,1,2) THEN 'WINTER'
WHEN MONTH(To_timestamp({{x}})) in (3,4,5) THEN 'SPRING'
WHEN MONTH(To_timestamp({{x}})) in (6,7,8) THEN 'SUMMER'
ELSE 'AUTUMN'
END
{% endmacro %}




{% macro day_type(x) %}
CASE
    WHEN dayname(To_timestamp({{x}})) in ('Sat','Sun')
    THEN 'BUSINESSDAY' ELSE 'WEEEKDAYS' 
    END 
{% endmacro %}

