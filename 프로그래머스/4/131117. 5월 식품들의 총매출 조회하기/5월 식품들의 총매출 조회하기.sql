-- 코드를 입력하세요
select p.PRODUCT_ID, p.PRODUCT_NAME, o.AMOUNT * p.PRICE as TOTAL_SALES
from FOOD_PRODUCT p join (select PRODUCT_ID, sum(AMOUNT) as AMOUNT
                        from FOOD_ORDER
                        where date_format(PRODUCE_DATE, '%Y-%m') = '2022-05'
                        group by PRODUCT_ID) as o
                    on p.PRODUCT_ID = o.PRODUCT_ID
order by TOTAL_SALES desc, p.PRODUCT_ID asc