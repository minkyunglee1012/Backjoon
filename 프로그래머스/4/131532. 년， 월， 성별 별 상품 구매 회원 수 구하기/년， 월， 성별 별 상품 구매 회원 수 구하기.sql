-- 코드를 입력하세요
SELECT 
    DATE_FORMAT(o.SALES_DATE, '%Y') AS YEAR, 
    DATE_FORMAT(o.SALES_DATE, '%m') AS MONTH, 
    u.GENDER, 
    COUNT(DISTINCT u.USER_ID) AS USERS
FROM 
    USER_INFO u
JOIN 
    ONLINE_SALE o
ON 
    u.USER_ID = o.USER_ID
WHERE 
    u.GENDER IS NOT NULL
GROUP BY 
    YEAR, MONTH, u.GENDER
ORDER BY 
    YEAR, MONTH, u.GENDER;
