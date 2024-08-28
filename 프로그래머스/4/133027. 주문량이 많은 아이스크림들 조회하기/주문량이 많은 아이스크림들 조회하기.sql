select FLAVOR
from (select FLAVOR, TOTAL_ORDER from FIRST_HALF
     union all
     select FLAVOR, TOTAL_ORDER from JULY) COMBINED_SALE
group by FLAVOR
order by sum(TOTAL_ORDER) desc
limit 3;