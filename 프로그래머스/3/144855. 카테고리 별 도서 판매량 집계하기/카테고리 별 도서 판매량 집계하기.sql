-- 코드를 입력하세요
select b.CATEGORY, sum(SUM_SALES) as TOTAL_SALES
from BOOK b join (select BOOK_ID, sum(SALES) as SUM_SALES
                 from BOOK_SALES
                 where date_format(SALES_DATE, '%Y-%m') = '2022-01'
                 group by BOOK_ID) as s
            on b.BOOK_ID = s.BOOK_ID
group by b.CATEGORY
order by b.CATEGORY asc