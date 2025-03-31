--1. Напишете заявка, която извежда имената на всички кораби без повторения,
--които са участвали в поне една битка и чиито имена започват с C или K.
SELECT DISTINCT SHIPS.NAME
FROM SHIPS INNER JOIN OUTCOMES
ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.SHIP LIKE 'C%' OR OUTCOMES.SHIP LIKE 'K%';

--2. Напишете заявка, която извежда име и държава на всички кораби, които
--никога не са потъвали в битка (може и да не са участвали).

SELECT SHIPS.NAME, CLASSES.COUNTRY
FROM SHIPS INNER JOIN CLASSES
ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.NAME NOT IN (SELECT OUTCOMES.SHIP
                            FROM OUTCOMES
                            WHERE UPPER(OUTCOMES.RESULT) LIKE UPPER('sunk'));

--3. Напишете заявка, която извежда държавата и броя на потъналите кораби за
--тази държава. Държави, които нямат кораби или имат кораб, но той не е
--участвал в битка, също да бъдат изведени.
SELECT CLASSES.COUNTRY, COUNT(OUTCOMES.SHIP)
FROM SHIPS
    RIGHT OUTER JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
    LEFT OUTER JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
WHERE OUTCOMES.RESULT IS NULL OR UPPER(OUTCOMES.RESULT) LIKE UPPER('sunk')
GROUP BY CLASSES.COUNTRY;

--4. Напишете заявка, която извежда име на битките, които са по-мащабни (с
--повече участващи кораби) от битката при Guadalcanal.
SELECT OUTCOMES.BATTLE
FROM OUTCOMES
GROUP BY OUTCOMES.BATTLE
HAVING COUNT(OUTCOMES.SHIP) > (SELECT COUNT(OUTCOMES.SHIP)
                              FROM OUTCOMES
                              WHERE OUTCOMES.BATTLE = 'Guadalcanal');

--5. Напишете заявка, която извежда име на битките, които са по-мащабни (с
--повече участващи страни) от битката при Surigao Strait.
SELECT OUTCOMES.BATTLE
FROM OUTCOMES
INNER JOIN SHIPS ON OUTCOMES.SHIP = SHIPS.NAME
RIGHT OUTER JOIN CLASSES ON SHIPS.CLASS = CLASSES.CLASS
WHERE SHIPS.CLASS IS NOT NULL
GROUP BY OUTCOMES.BATTLE
HAVING COUNT(CLASSES.COUNTRY) > (SELECT COUNT(CLASSES.COUNTRY)
                                FROM CLASSES
                                LEFT OUTER JOIN SHIPS ON CLASSES.CLASS = SHIPS.CLASS
                                INNER JOIN OUTCOMES ON SHIPS.NAME = OUTCOMES.SHIP
                                WHERE SHIPS.CLASS IS NOT NULL 
                                AND OUTCOMES.BATTLE = 'Surigao Strait');

--6. Напишете заявка, която извежда имената на най-леките кораби с най-много
--оръдия.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
FROM SHIPS JOIN CLASSES
ON SHIPS.CLASS = CLASSES.CLASS
WHERE CLASSES.DISPLACEMENT <= ALL (SELECT CLASSES.DISPLACEMENT
                                  FROM CLASSES JOIN SHIPS 
                                  ON SHIPS.CLASS = CLASSES.CLASS)
AND CLASSES.DISPLACEMENT >= ALL (SELECT CLASSES.NUMGUNS
                          FROM CLASSES JOIN SHIPS 
                          ON SHIPS.CLASS = CLASSES.CLASS);

--7. Изведете броя на корабите, които са били увредени в битка, но са били
--поправени и по-късно са победили в друга битка.
SELECT COUNT(MY_OUTCOMES.SHIP) AS SHIPS_COUNT
FROM OUTCOMES AS MY_OUTCOMES JOIN BATTLES
ON MY_OUTCOMES.BATTLE = BATTLES.NAME
GROUP BY MY_OUTCOMES.SHIP, MY_OUTCOMES.RESULT, BATTLES.DATE
HAVING MY_OUTCOMES.RESULT = 'ok'
AND BATTLES.DATE > (SELECT BATTLES.DATE
                      FROM OUTCOMES JOIN BATTLES
                      ON OUTCOMES.BATTLE = BATTLES.NAME
                      WHERE OUTCOMES.SHIP = MY_OUTCOMES.SHIP
                      GROUP BY OUTCOMES.SHIP, OUTCOMES.RESULT, BATTLES.DATE
                      HAVING OUTCOMES.RESULT = 'damaged');

--8. Изведете име на корабите, които са били увредени в битка, но са били
--поправени и по-късно са победили в по-мащабна битка (с повече кораби).
SELECT MY_OUTCOMES.SHIP
FROM OUTCOMES AS MY_OUTCOMES JOIN BATTLES
  ON MY_OUTCOMES.BATTLE = BATTLES.NAME
GROUP BY MY_OUTCOMES.SHIP, MY_OUTCOMES.RESULT, BATTLES.DATE
HAVING MY_OUTCOMES.RESULT = 'ok'
AND BATTLES.DATE > (SELECT BATTLES.DATE
                    FROM OUTCOMES JOIN BATTLES
                      ON OUTCOMES.BATTLE = BATTLES.NAME
                    WHERE OUTCOMES.SHIP = MY_OUTCOMES.SHIP
                    GROUP BY OUTCOMES.SHIP, OUTCOMES.RESULT, BATTLES.DATE
                    HAVING OUTCOMES.RESULT = 'damaged'
                    )
AND COUNT(MY_OUTCOMES.SHIP) >= (SELECT COUNT(OUTCOMES.SHIP)
                         FROM OUTCOMES JOIN BATTLES
                          ON OUTCOMES.BATTLE = BATTLES.NAME
                         WHERE OUTCOMES.SHIP = MY_OUTCOMES.SHIP
                         GROUP BY OUTCOMES.BATTLE, OUTCOMES.RESULT, BATTLES.DATE
                         HAVING OUTCOMES.RESULT = 'damaged') ;
