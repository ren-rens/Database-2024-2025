---1. Напишете заявка, която извежда името на корабите с водоизместимост над 50000.
SELECT SHIPS.NAME
FROM CLASSES JOIN SHIPS
ON CLASSES.CLASS = SHIPS.CLASS
WHERE CLASSES.DISPLACEMENT > 50000;

---2. Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на
---всички кораби, участвали в битката при Guadalcanal.
SELECT SHIPS.NAME, CLASSES.DISPLACEMENT, CLASSES.NUMGUNS
FROM CLASSES JOIN SHIPS
ON CLASSES.CLASS = SHIPS.CLASS
JOIN OUTCOMES
ON OUTCOMES.SHIP = SHIPS.NAME
WHERE OUTCOMES.BATTLE = 'Guadalcanal';

---3. Напишете заявка, която извежда имената на тези държави, които имат както
---бойни кораби, така и бойни крайцери.
SELECT C1.COUNTRY
FROM CLASSES AS C1, CLASSES AS C2
WHERE C1.COUNTRY = C2.COUNTRY AND C1.TYPE > C2.TYPE;

---4. Напишете заявка, която извежда имената на тези кораби, които са били
---повредени в една битка, но по-късно са участвали в друга битка.
TO DO
