-- 코드를 입력하세요
select info.REST_ID, info.REST_NAME, info.FOOD_TYPE, info.FAVORITES, info.ADDRESS, review.AVG_SCORE as SCORE
from REST_INFO info join (select REST_ID, round(avg(REVIEW_SCORE), 2) as AVG_SCORE
                         from REST_REVIEW
                         group by REST_ID) as review
                    on info.REST_ID = review.REST_ID
where info.ADDRESS like '서울%'
order by SCORE desc, FAVORITES desc