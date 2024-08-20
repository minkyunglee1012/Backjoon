-- 코드를 작성해주세요
select ID,
    (case 
    when rank() over (order by SIZE_OF_COLONY desc) <= (select count(SIZE_OF_COLONY) from ECOLI_DATA)/4
    then 'CRITICAL'
    
    when rank() over (order by SIZE_OF_COLONY desc) <= (select count(SIZE_OF_COLONY) from ECOLI_DATA)/4*2
    then 'HIGH'

    WHEN rank() over (order by SIZE_OF_COLONY desc) <= (select count(SIZE_OF_COLONY) from ECOLI_DATA)/4*3
    then 'MEDIUM'

    WHEN rank() over (order by SIZE_OF_COLONY desc) <= (select count(SIZE_OF_COLONY) from ECOLI_DATA)
    then 'LOW'
    end) COLONY_NAME
from ECOLI_DATA
order by ID asc;