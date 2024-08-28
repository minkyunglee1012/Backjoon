-- 코드를 작성해주세요
with GRADE as (
            select EMP_NO, (case when avg(SCORE) >= 96 then 'S'
                                when avg(SCORE) >= 90 then 'A'
                                when avg(SCORE) >= 80 then 'B'
                                else 'C' end ) as GRADE,
            (case when avg(SCORE) >= 96 then 0.2
                                when avg(SCORE) >= 90 then 0.15
                                when avg(SCORE) >= 80 then 0.1
                                else 0 end ) as BONUS
            from HR_GRADE
            group by EMP_NO)
            
select e.EMP_NO, e.EMP_NAME, g.GRADE, g.BONUS * e.SAL as BONUS
from HR_EMPLOYEES e join GRADE g on e.EMP_NO = g.EMP_NO 
order by e.EMP_NO asc;