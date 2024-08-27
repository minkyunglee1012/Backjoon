select d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
from SKILLCODES s join DEVELOPERS d on s.CODE & d.SKILL_CODE = s.CODE
where s.CATEGORY = 'Front End'
group by d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
order by d.ID