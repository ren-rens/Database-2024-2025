USE MASTER
GO

USE pc
GO

--4. Използвайте две INSERT заявки. Съхранете в базата данни факта, че персонален компютър
--модел 1100 е направен от производителя C, има процесор 2400 MHz, RAM 2048 MB, твърд диск
--500 GB, 52x оптично дисково устройство и струва $299. Нека новият компютър има код 12.
--Забележка: модел и CD са от тип низ.
SELECT * FROM product;
INSERT INTO product(maker, model, type)
VALUES('C', '1100', 'PC');
SELECT * FROM product;
SELECT * FROM pc;
INSERT INTO pc(code, model, speed, ram, hd, cd, price)
VALUES(12, '1100', 2400, 2048, 500, '52', 299);
SELECT * FROM pc;


--5. Да се изтрие наличната информация в таблицата PC за компютри модел 1100.
DELETE FROM pc
WHERE model='1100';

SELECT * FROM pc;

--6. Да се изтрият от таблицата Laptop всички лаптопи, направени от производител, който не
--произвежда принтери.
SELECT * FROM laptop;
DELETE FROM laptop
WHERE model IN (SELECT model
 FROM product
 WHERE maker NOT IN (SELECT maker
 FROM product
 WHERE UPPER(type) LIKE 'PRINTER'));

SELECT * FROM laptop;
--7. Производител А купува производител B. На всички продукти на В променете производителя да
--бъде А.
SELECT * FROM product;

UPDATE product
SET maker = 'A'
WHERE maker = 'B';

SELECT * FROM product;

--8. Да се намали наполовина цената на всеки компютър и да се добавят по 20 GB към всеки твърд
--диск.
SELECT * FROM pc;
UPDATE pc
SET price=price*0.5,
 hd=hd+20;

SELECT * FROM pc;

--9. За всеки лаптоп от производител B добавете по един инч към диагонала на екрана.
UPDATE laptop
SET screen = screen + 1
WHERE model IN (SELECT model
FROM product
WHERE maker = 'B');
