-- 코드를 작성해주세요
select a.ID, ifnull(b.CHILD_COUNT, 0) as CHILD_COUNT
from ECOLI_DATA a left join (select PARENT_ID, count(ID) as CHILD_COUNT
                       from ECOLI_DATA
                       group by PARENT_ID) as b
                on a.ID = b.PARENT_ID
order by ID