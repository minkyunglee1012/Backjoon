select CATEGORY, PRICE as MAX_PRICE, PRODUCT_NAME
from FOOD_PRODUCT fp
where CATEGORY in ('과자', '국', '김치', '식용유')
    and PRICE = ( select max(PRICE) 
                from FOOD_PRODUCT
                where CATEGORY = fp.CATEGORY)
group by CATEGORY, PRODUCT_NAME
order by MAX_PRICE desc
