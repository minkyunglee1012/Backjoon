-- 코드를 입력하세요
select p.PRODUCT_CODE, o.SALES_AMOUNT * p.PRICE as SALES
from PRODUCT p join (select PRODUCT_ID, sum(SALES_AMOUNT) as SALES_AMOUNT
                    from OFFLINE_SALE
                    group by PRODUCT_ID) as o
                on p.PRODUCT_ID = o.PRODUCT_ID
order by SALES desc, PRODUCT_CODE asc