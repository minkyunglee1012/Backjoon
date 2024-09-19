-- 코드를 작성해주세요
with HR_GRADE_YEAR as (select EMP_NO, sum(SCORE) as SUM_SCORE
                      from HR_GRADE
                      where YEAR = 2022
                      group by EMP_NO)
                      
select SUM_SCORE as SCORE, a.EMP_NO, b.EMP_NAME, b.POSITION, b.EMAIL
from HR_GRADE_YEAR a join HR_EMPLOYEES b on a.EMP_NO = b.EMP_NO
order by SUM_SCORE desc
limit 1