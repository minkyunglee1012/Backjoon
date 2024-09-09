select HOUR, count(ANIMAL_ID) as COUNT
from ( select (row_number() over() - 1) as HOUR
      from ANIMAL_OUTS
      limit 24) as A
      left join ANIMAL_OUTS on HOUR = hour(DATETIME)
group by HOUR
order by HOUR
