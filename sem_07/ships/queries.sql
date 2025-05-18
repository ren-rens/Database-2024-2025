USE master
GO

USE ships
GO

--10. Два британски бойни кораба от класа Nelson - Nelson и Rodney - са били пуснати на вода
--едновременно през 1927 г. Имали са девет 16-инчови оръдия (bore) и водоизместимост от 34000
--тона (displacement). Добавете тези факти към базата от данни.
SELECT * FROM SHIPS;
SELECT * FROM CLASSES;

INSERT INTO SHIPS(NAME, CLASS, LAUNCHED)
VALUES ('SHIP1', 'Nelson-Nelson', 1927),
 ('SHIP2', 'Rodney', 1927);

INSERT INTO CLASSES(CLASS, COUNTRY, TYPE, BORE, DISPLACEMENT)
VALUES ('Nelson-Nelson', 'Gt. Britain','bb', 16, 34000),
 ('Rodney', 'Gt. Britain', 'bb', 16, 34000);

SELECT * FROM SHIPS;
SELECT * FROM CLASSES;

--11. Изтрийте от таблицата Ships всички кораби, които са потънали в битка.
SELECT * FROM SHIPS;

DELETE FROM SHIPS
WHERE NAME IN (SELECT SHIP
 FROM OUTCOMES
 WHERE RESULT = 'sunk');

SELECT * FROM SHIPS;
--12. Променете данните в релацията Classes така, че калибърът (bore) да се измерва в сантиметри (в
--момента е в инчове, 1 инч ~ 2.5 см) и водоизместимостта да се измерва в метрични тонове (1 м.т.= 1.1 т.)
SELECT * FROM CLASSES;
UPDATE CLASSES
SET BORE = BORE * 2.5,
DISPLACEMENT = DISPLACEMENT * 1.1;

SELECT * FROM CLASSES;
