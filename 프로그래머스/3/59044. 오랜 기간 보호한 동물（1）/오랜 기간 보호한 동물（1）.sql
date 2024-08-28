-- 코드를 입력하세요
select A.NAME, A.DATETIME
from ANIMAL_INS A left join ANIMAL_OUTS B on A.ANIMAL_ID = B.ANIMAL_ID
where A.ANIMAL_ID is not null and B.ANIMAL_ID is null
order by A.DATETIME 
limit 3