-- 코드를 입력하세요
select b.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY, sum(PRICE * SUM_SALES) as TOTAL_SALES
from BOOK b join AUTHOR a on b.AUTHOR_ID = a.AUTHOR_ID
            join (select BOOK_ID, sum(SALES) as SUM_SALES 
                  from BOOK_SALES 
                  where SALES_DATE >= '2022-01-01' and SALES_DATE <= '2022-01-31'
                  group by BOOK_ID) s 
                  on b.BOOK_ID = s.BOOK_ID
group by b.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY
order by b.AUTHOR_ID asc, b.CATEGORY desc