USE master
GO

USE pc
GO

--1. Напишете заявка, която извежда средната честота на персоналните компютри.
SELECT CONVERT(DECIMAL(18, 2), AVG(speed)) AS AvgSpeed
FROM pc;

--2. Напишете заявка, която извежда средния размер на екраните на лаптопите за
--всеки производител.
SELECT product.maker, AVG(laptop.screen) AS AvgScreen
FROM laptop JOIN product
ON laptop.model = product.model
GROUP BY product.maker;

--3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000.
SELECT * FROM laptop

SELECT CONVERT(DECIMAL(18, 2), AVG(speed)) AS AvgSpeed
FROM laptop
WHERE price > 1000;
--4. Напишете заявка, която извежда средната цена на персоналните компютри,
--произведени от производител ‘A’.
SELECT product.maker, CONVERT(DECIMAL(18, 2), AVG(price)) AS AvgSpeed
FROM pc JOIN product
ON pc.model = product.model
GROUP BY product.maker
HAVING product.maker = 'A';

--5. Напишете заявка, която извежда средната цена на персоналните компютри и
--лаптопите за производител ‘B’.



--6. Напишете заявка, която извежда средната цена на персоналните компютри
--според различните им честоти.
SELECT speed, AVG(price) AS AvgPrice
FROM pc
GROUP BY speed

--7. Напишете заявка, която извежда производителите, които са произвели поне 3
--различни персонални компютъра (с различен код).
SELECT product.maker, COUNT(product.model) AS number_of_pc
FROM product
WHERE UPPER(product.type) LIKE UPPER('PC')
GROUP BY product.maker
HAVING COUNT(product.model) >= 3;

--8. Напишете заявка, която извежда производителите с най-висока цена на
--персонален компютър.
SELECT TOP 1 product.maker, MAX(pc.price) AS price
FROM product JOIN pc
ON product.model = pc.model
WHERE UPPER(product.type) LIKE 'PC'
GROUP BY product.maker;

--9. Напишете заявка, която извежда средната цена на персоналните компютри за
--всяка честота по-голяма от 800.
SELECT pc.speed, AVG(pc.price) AS AvgPrice
FROM pc
GROUP BY pc.speed
HAVING pc.speed > 800;

--10.Напишете заявка, която извежда средния размер на диска на тези персонални
--компютри, произведени от производители, които произвеждат и принтери.
--Резултатът да се изведе за всеки отделен производител
SELECT product.maker, CONVERT(DECIMAL(18, 2), AVG(pc.hd)) AS AvgHDD
FROM product JOIN pc
ON product.model = pc.model
WHERE product.maker IN (SELECT product.maker
FROM product
WHERE UPPER(product.type) LIKE 'PRINTER')
GROUP BY product.maker;
