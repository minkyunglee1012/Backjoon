select ID
from (
        select ID, PARENT_ID
        from ECOLI_DATA
        where PARENT_ID in (select ID from ECOLI_DATA where PARENT_ID
                           in (select ID from ECOLI_DATA where PARENT_ID is null))
) as A
order by 1