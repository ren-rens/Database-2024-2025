--1. Напишете заявка, която извежда заглавие и година на всички филми, които са
--по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е
--неизвестна, заглавието и годината на този филм също да се изведат.
SELECT MOVIE.TITLE, MOVIE.YEAR, MOVIE.LENGTH
FROM MOVIE
WHERE (MOVIE.LENGTH > 120 AND MOVIE.YEAR < 2000) OR
MOVIE.LENGTH IS NULL;

--2. Напишете заявка, която извежда име и пол на всички актьори (мъже и жени),
--чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде
--подреден по име в намаляващ ред.
SELECT NAME, GENDER
FROM MOVIESTAR
WHERE NAME LIKE 'J%' AND BIRTHDATE > 1948
ORDER BY NAME DESC;

--3. Напишете заявка, която извежда име на студио и брой на актьорите,
--участвали във филми, които са създадени от това студио.
SELECT STUDIO.NAME, COUNT(STARSIN.STARNAME) AS num_actors
FROM STUDIO JOIN MOVIE
ON STUDIO.PRESC# = MOVIE.PRODUCERC#
JOIN STARSIN
ON STARSIN.MOVIETITLE = MOVIE.TITLE
GROUP BY STUDIO.NAME;

--4. Напишете заявка, която за всеки актьор извежда име на актьора и броя на
--филмите, в които актьорът е участвал.
SELECT MOVIESTAR.NAME, COUNT(STARSIN.MOVIETITLE) AS ACTORS_COUNT
FROM MOVIESTAR LEFT JOIN STARSIN
ON MOVIESTAR.NAME = STARSIN.STARNAME
GROUP BY MOVIESTAR.NAME;

--5. Напишете заявка, която за всяко студио извежда име на студиото и заглавие
--на филма, излязъл последно на екран за това студио.
SELECT STUDIO.NAME, MOVIE.TITLE, MOVIE.YEAR
FROM STUDIO JOIN MOVIE
ON STUDIO.NAME = MOVIE.STUDIONAME
WHERE MOVIE.YEAR >= ALL (SELECT MOVIE.YEAR
FROM MOVIE
WHERE MOVIE.STUDIONAME = STUDIO.NAME);

--6. Напишете заявка, която извежда името на най-младия актьор (мъж).
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' AND
BIRTHDATE >= ALL (SELECT BIRTHDATE
FROM MOVIESTAR
WHERE GENDER = 'M');

--7. Напишете заявка, която извежда име на актьор и име на студио за тези
--актьори, участвали в най-много филми на това студио.

--8. Напишете заявка, която извежда заглавие и година на филма, и брой на
--актьорите, участвали в този филм за тези филми с повече от двама актьори.
SELECT MOVIETITLE, MOVIEYEAR, COUNT(STARNAME) AS ACTORS_CNT
FROM STARSIN
GROUP BY MOVIETITLE, MOVIEYEAR
HAVING COUNT(STARNAME) > 2;
