select USER_ID, PRODUCT_ID
from ONLINE_SALE
group by 1, 2
having count(1) >= 2
order by USER_ID, PRODUCT_ID desc