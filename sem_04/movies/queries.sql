use master
go
use movies
go

--1. Напишете заявка, която извежда името на продуцента и имената на
--филмите, продуцирани от продуцента на филма ‘Star Wars’.
SELECT MOVIE.TITLE, MOVIEEXEC.NAME
FROM MOVIEEXEC INNER JOIN MOVIE
ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
WHERE MOVIE.PRODUCERC# = (SELECT MOVIE.PRODUCERC#
FROM MOVIE
WHERE MOVIE.TITLE = 'Star Wars');

--2. Напишете заявка, която извежда имената на продуцентите на филмите, в
--които е участвал ‘Harrison Ford’
SELECT DISTINCT MOVIEEXEC.NAME
FROM MOVIEEXEC JOIN MOVIE
ON MOVIEEXEC.CERT# = MOVIE.PRODUCERC#
JOIN STARSIN
ON MOVIE.TITLE = STARSIN.MOVIETITLE
WHERE STARSIN.STARNAME LIKE 'Harrison Ford';

--3. Напишете заявка, която извежда името на студиото и имената на
--актьорите, участвали във филми, произведени от това студио, подредени
--по име на студио.
SELECT DISTINCT MOVIE.STUDIONAME, STARSIN.STARNAME
FROM MOVIE JOIN STARSIN
ON MOVIE.TITLE = STARSIN.MOVIETITLE
ORDER BY MOVIE.STUDIONAME;

--4. Напишете заявка, която извежда имената на актьорите, участвали във
--филми на продуценти с най-големи нетни активи.
SELECT STARSIN.STARNAME, MOVIEEXEC.NETWORTH, MOVIE.TITLE
FROM STARSIN JOIN MOVIE
ON STARSIN.MOVIETITLE = MOVIE.TITLE
JOIN MOVIEEXEC
ON MOVIE.PRODUCERC# = MOVIEEXEC.CERT#
WHERE MOVIEEXEC.NETWORTH >= ALL(
SELECT MOVIEEXEC.NETWORTH
FROM MOVIEEXEC
);

--5. Напишете заявка, която извежда имената на актьорите, които не са
--участвали в нито един филм.
SELECT MOVIESTAR.NAME
FROM MOVIESTAR LEFT OUTER JOIN STARSIN
ON MOVIESTAR.NAME = STARSIN.STARNAME
WHERE STARSIN.STARNAME IS NULL;
