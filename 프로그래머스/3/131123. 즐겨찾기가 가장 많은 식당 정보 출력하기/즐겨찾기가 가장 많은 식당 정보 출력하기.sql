with REST_RANK as (
    select FOOD_TYPE, REST_ID, REST_NAME, FAVORITES,
            row_number() over (partition by FOOD_TYPE order by FAVORITES desc) as RN
    from REST_INFO
    )
    
select FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
from REST_RANK
where RN = 1
order by FOOD_TYPE desc