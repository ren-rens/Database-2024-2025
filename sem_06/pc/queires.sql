
--1. Напишете заявка, която извежда всички модели лаптопи, за които се
--предлагат както разновидности с 15" екран, така и с 11" екран.
SELECT laptop.model
FROM laptop
WHERE laptop.screen = 11 AND laptop.model IN (SELECT laptop.model
                      FROM laptop
                      WHERE laptop.screen = 15);

--2. Да се изведат различните модели компютри, 
--чиято цена е по-ниска от най-евтиния лаптоп, произвеждан от същия производител.
SELECT DISTINCT PC.MODEL
FROM PC JOIN PRODUCT AS MY_PRODUCT
             ON PC.MODEL = MY_PRODUCT.MODEL
GROUP BY PC.MODEL, MY_PRODUCT.MAKER, PC.PRICE
HAVING PC.PRICE < (SELECT TOP 1 LAPTOP.PRICE
                   FROM LAPTOP JOIN PRODUCT
                    ON LAPTOP.MODEL = PRODUCT.MODEL
                   GROUP BY PRODUCT.MAKER, LAPTOP.PRICE
                   HAVING PRODUCT.MAKER = MY_PRODUCT.MAKER
                   ORDER BY LAPTOP.PRICE);

--3. Един модел компютри може да се предлага в няколко разновидности с
--различна цена. Да се изведат тези модели компютри, чиято средна цена (на
--различните му разновидности) е по-ниска от най-евтиния лаптоп, произвеждан
--от същия производител.


--4. Напишете заявка, която извежда за всеки компютър код на продукта,
--производител и брой компютри, които имат цена, по-голяма или равна на
--неговата.
SELECT COMP.CODE, PRODUCT.MAKER,
       (SELECT COUNT(PC.CODE)
       FROM PC
       WHERE PC.PRICE >= COMP.PRICE)
FROM PC AS COMP JOIN PRODUCT
ON COMP.MODEL = PRODUCT.MODEL
