--Obtener los 5 premios nobel mas recientes
SELECT PR.WIN_DATE, CAT.PRIZE_NAME 
FROM NOBEL.PRIZE PR
INNER JOIN NOBEL.CATEGORIES CAT 
    ON PR.CATEGORY_ID = CAT.CATEGORY_ID
    WHERE ROWNUM <= 5
    ORDER BY PR.WIN_DATE DESC;

--Obtener los ultimos 10 premios nobel de fisica
SELECT PR.WIN_DATE, CAT.PRIZE_NAME, CAT.CATEGORY 
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.CATEGORIES CAT 
        ON PR.CATEGORY_ID = CAT.CAATEGORY_ID
        WHERE ROWNUM <= 10 
        ORDER BY PR.WIN_DATE DESC;

--obtener las ultimas personas que han ganado mas de un premio
SELECT PR.PRIZE_ID, CAT.PRIZE_NAME, W.NAME, SUM() WON
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.PRICE_WINNERS PW 
        ON PR.PRIZE_ID = PW.PRIZE_ID
    INNER JOIN NOBEL.WINNERS W
        ON PW.PERSON_ID = W.PERSON_ID
        WHERE WON>1;
        
--obtener el campo/lenguaje con mas premios nobel
SELECT F.FIELDS, COUNT(PR.FIELD_ID) NUM_WIN
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.FIELDS F
        ON PR.FIELD_ID = F.FIELD_ID
GROUP BY F.FIELD
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM NOBEL.PRIZE GROUP BY FIELD_ID);

--obtener los premios ganados desde 1980 al 1998 en quimica
SELECT *
    FROM(SELECT PR.WIN_DATE
    FROM NOBEL.CATEGORIES CAT
    INNER JOIN NOBEL.PRIZE PR
        ON PR.CATEGORY_ID = CAT.CATEGORY_ID
    WHERE (PR.WIN_DATE between 1980 AND 1990))
        WHERE CAT.CATEGORY = "CHEMISTRY";
        
--obtener el premio nobel ganado en menos ocaciones
SELECT CAT.CATEGORY, COUNT(PR.CATEGORY_ID) WON
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.CATEGORIES CAT 
        ON PR.CATEGORY_ID = CAT.CATEGORY_ID
GROUP BY CAT.CATEGORY
HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM NOBEL.PRIZE GROUP BY CATEGORY_ID);

--obtener e pais con mas premios nobel
SELECT C.COUNTRY, COUNT(PW.COUNTRY_ID) WON
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.PRICE_WINNERS PW 
        ON PR.PRIZE_ID = PW.PRIZE_ID
    INNER JOIN NOBEL.COUNTRIES C
        ON PW.COUNTRY_ID = C.COUNTRY_ID
GROUP BY C.COUNTRY
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM NOBEL.PRICE_WINNERS GROUP BY COUNTRY_ID);

--obtener los premios nobel compartidos (mas de 1 ganador en la misma categoria y ano)


--obtener el promedio de edad de todos los ganadores al momento en que ganan su premio

SELECT *
    FROM  AVG (SELECT PR.WIN_DATE AS WON
    FROM NOBEL.PRIZE PR
    INNER JOIN NOBEL.PRICE_WINNERS PW
        ON PR.PRIZE_ID = PW.PRIZE_ID
    INNER JOIN NOBEL.WINNERS W
        ON PW.PERSON_ID = W.PERSON_ID
    WHERE ;  
