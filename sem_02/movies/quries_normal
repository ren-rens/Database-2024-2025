---1. Напишете заявка, която извежда имената на актьорите мъже, участвали във
---филма The Usual Suspects.
SELECT NAME
FROM MOVIESTAR
WHERE MOVIESTAR.GENDER = 'M'

INTERSECT

SELECT STARNAME
FROM STARSIN
WHERE UPPER(STARSIN.MOVIETITLE) = UPPER('The Usual Suspects');

---2. Напишете заявка, която извежда имената на актьорите, ---
---участвали във филми от 1995, продуцирани от студио MGM.---
SELECT STARSIN.STARNAME 
FROM MOVIE, STARSIN, STUDIO
WHERE MOVIE.YEAR = 1995 AND 
STUDIO.NAME = 'MGM' AND
MOVIE.STUDIONAME = STUDIO.NAME AND
STARSIN.MOVIETITLE = MOVIE.TITLE;

--3. Напишете заявка, която извежда имената на продуцентите, които са
--продуцирали филми на студио MGM.
SELECT MOVIEEXEC.NAME
FROM MOVIEEXEC JOIN MOVIE
ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE MOVIE.STUDIONAME = 'MGM';

---4. Напишете заявка, която извежда имената на филми с дължина, по-голяма от
---дължината на филма Star Wars.
SELECT M2.TITLE
FROM MOVIE AS M1 CROSS JOIN MOVIE AS M2
WHERE M1.TITLE = 'Star Wars' AND M1.LENGTH < M2.LENGTH

---5. Напишете заявка, която извежда имената
---на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT ME2.NAME
FROM MOVIEEXEC AS ME1 CROSS JOIN MOVIEEXEC AS ME2
WHERE ME1.NAME = 'Stephen Spielberg' AND ME1.NETWORTH < ME2.NETWORTH;
