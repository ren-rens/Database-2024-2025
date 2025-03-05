---1. Напишете заявка, която извежда имената на актьорите мъже, участвали във
---филма The Usual Suspects.
SELECT NAME
FROM MOVIESTAR, STARSIN
WHERE MOVIESTAR.NAME = STARSIN.STARNAME AND 
MOVIESTAR.GENDER = 'M' AND STARSIN.MOVIETITLE LIKE '%The Usual Suspects%';

---2. Напишете заявка, която извежда имената на актьорите, участвали във филми от
---1995, продуцирани от студио MGM.
SELECT STARSIN.STARNAME 
FROM MOVIE, STARSIN, STUDIO
WHERE MOVIE.YEAR = 1995 AND 
STUDIO.NAME = 'MGM' AND
MOVIE.STUDIONAME = STUDIO.NAME AND
STARSIN.MOVIETITLE = MOVIE.TITLE;

--3. Напишете заявка, която извежда имената на продуцентите, които са
--продуцирали филми на студио MGM.
SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIEEXEC, MOVIE
WHERE MOVIEEXEC.CERT# = MOVIE.PRODUCERC# AND
MOVIE.STUDIONAME = 'MGM';

---4. Напишете заявка, която извежда имената на филми с дължина, по-голяма от
---дължината на филма Star Wars.
SELECT TITLE
FROM MOVIE
WHERE MOVIE.LENGTH > (SELECT LENGTH
                      FROM MOVIE
                      WHERE MOVIE.TITLE LIKE '%Star Wars%');
                      
                      
---5. Напишете заявка, която извежда имената
---на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT NAME
FROM MOVIEEXEC
WHERE MOVIEEXEC.NETWORTH > (SELECT NETWORTH
                            FROM MOVIEEXEC
                            WHERE MOVIEEXEC.NAME LIKE '%Stephen Spielberg%');
