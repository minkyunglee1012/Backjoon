-- 코드를 입력하세요
with USED_GOODS_DONE as (
            select * from USED_GOODS_BOARD where STATUS = 'DONE'
            )

select d.WRITER_ID, u.NICKNAME, sum(d.PRICE) as TOTAL_SALES
from USED_GOODS_DONE d join USED_GOODS_USER u on d.WRITER_ID = u.USER_ID
group by d.WRITER_ID
having sum(d.PRICE) >= 700000
order by TOTAL_SALES asc
