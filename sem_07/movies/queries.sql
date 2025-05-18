USE master
GO

USE movies
GO

--1. Да се вмъкне информация за актрисата
--Nicole Kidman. За нея знаем само,
--че е родена на 20.06.1967.
SELECT * FROM MOVIESTAR;

INSERT INTO MOVIESTAR(NAME, BIRTHDATE)
VALUES('Nicole Kidman', '1967-06-20');
SELECT * FROM MOVIESTAR;

--2. Да се изтрият всички продуценти с нетни активи под 30 милиона.
SELECT * FROM MOVIEEXEC;

DELETE FROM MOVIEEXEC
WHERE NETWORTH < 30000000;
SELECT * FROM MOVIEEXEC;

--3. Да се изтрие информацията за всички филмови звезди, за които не се знае адреса
SELECT * FROM MOVIESTAR;

DELETE FROM MOVIESTAR
WHERE ADDRESS IS NULL;

SELECT * FROM MOVIESTAR;
