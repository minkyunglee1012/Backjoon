select ID,
       case NTILE(4) over (order by SIZE_OF_COLONY desc)
           when 1 then 'CRITICAL'
           when 2 then 'HIGH'
           when 3 then 'MEDIUM'
           else 'LOW'
       end as COLONY_NAME
from ECOLI_DATA
order by ID asc;

-- 윈도우 함수(Window Function)
-- 윈도우 함수는 SQL에서 데이터의 여러 행에 걸쳐 연산을 수행할 때 사용되는 함수입니다. 이 함수는 GROUP BY와 달리 전체 결과를 그룹으로 나누지 않고도 연산을 수행하며, 각 행에 대한 결과를 유지합니다. 따라서 데이터의 순서나 특정 조건에 따라 집계나 순위를 매기고 싶을 때 유용하게 사용할 수 있습니다.

-- 윈도우 함수는 일반적으로 다음과 같은 요소들로 구성
-- 함수명: 순위 매기기(RANK, ROW_NUMBER), 집계 함수(SUM, AVG, COUNT), 비율 계산(PERCENT_RANK, NTILE), 변환 함수 등 다양한 기능을 수행하는 함수명.
-- OVER 절: 함수가 작동할 **윈도우(범위)**를 정의합니다. 여기에는 정렬(ORDER BY)과 파티셔닝(PARTITION BY)을 지정할 수 있습니다.

-- 예시

SELECT 
    employee_id,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
-- 이 예제는 salary 기준으로 각 직원의 순위를 매기며, 순위는 RANK() 함수를 사용하여 계산됩니다. 높은 급여를 가진 직원이 상위 순위를 차지하게 됩니다.

-- NTILE 함수
-- NTILE 함수는 윈도우 함수 중 하나로, 데이터를 특정한 수의 그룹으로 나눌 때 사용됩니다. 예를 들어, 데이터를 4개의 그룹으로 나누고 싶다면 NTILE(4)을 사용합니다. 이 함수는 데이터의 순서에 따라 그룹을 나눠줍니다.

-- 사용법

NTILE(n) OVER (ORDER BY column_name)
-- n: 데이터를 나눌 그룹의 개수를 의미합니다.
-- ORDER BY: 어떤 열을 기준으로 데이터를 정렬할지를 지정합니다. 정렬된 순서대로 데이터가 n개의 그룹으로 나뉘게 됩니다.
  
-- 예시

SELECT 
    employee_id,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_group
FROM employees;
-- 이 쿼리는 salary를 기준으로 직원들을 내림차순 정렬한 뒤, 4개의 그룹으로 나눕니다. salary_group 컬럼에는 각 직원이 속한 그룹 번호(1, 2, 3, 4)가 표시됩니다.

-- 그룹 1: 상위 25%의 직원들.
-- 그룹 2: 다음 25%의 직원들.
-- 그룹 3: 그다음 25%의 직원들.
-- 그룹 4: 하위 25%의 직원들.


-- 윈도우 함수는 데이터의 여러 행에 걸쳐 연산을 수행하며, OVER 절을 통해 작동 범위를 정의합니다.
-- NTILE 함수는 데이터를 지정된 그룹 수만큼 나누고, 각 행이 속한 그룹 번호를 반환합니다. NTILE(4)의 경우 데이터를 4개의 그룹으로 나누어 상위부터 하위까지 고르게 분포시킵니다.
