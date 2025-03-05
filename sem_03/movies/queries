--1. Напишете заявка, която извежда имената на актрисите, 
---които са също и продуценти с нетни активи над 10 милиона
SELECT NAME
FROM MOVIESTAR
WHERE MOVIESTAR.NAME IN (SELECT NAME
FROM MOVIEEXEC
WHERE MOVIEEXEC.NETWORTH > 10000000
) AND MOVIESTAR.GENDER = 'F';

--2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти
SELECT MOVIESTAR.NAME
FROM MOVIESTAR
WHERE MOVIESTAR.NAME NOT IN (SELECT NAME
FROM MOVIEEXEC);


--3. Напишете заявка, която извежда имената на всички филми с дължина,
---по-голяма от дължината на филма ‘Star Wars’
SELECT TITLE
FROM MOVIE
WHERE MOVIE.LENGTH > (SELECT LENGTH
FROM MOVIE
WHERE UPPER(MOVIE.TITLE) LIKE UPPER('STAR WARS'));

--4. Напишете заявка, която извежда имената на продуцентите и имената на
--филмите за всички филми, които са продуцирани от продуценти с нетни
--активи по-големи от тези на ‘Merv Griffin’
SELECT MOVIE.TITLE, MOVIEEXEC.NAME
FROM MOVIE, MOVIEEXEC
WHERE MOVIEEXEC.NETWORTH > (SELECT NETWORTH
FROM MOVIEEXEC
WHERE UPPER(MOVIEEXEC.NAME) LIKE UPPER('Merv Griffin')) AND MOVIE.PRODUCERC# = MOVIEEXEC.CERT#;
