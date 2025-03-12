USE MASTER
GO

USE pc
GO

--1. Напишете заявка, която извежда производител, модел и тип на продукт за
--тези производители, за които съответният продукт не се продава (няма го
--в таблиците PC, Laptop или Printer).
SELECT DISTINCT product.maker, PRODUCT.model, product.type
FROM product LEFT OUTER JOIN pc
ON product.model = pc.model AND product.type = 'PC'
LEFT OUTER JOIN laptop
ON product.model = laptop.model AND product.type = 'Laptop'
LEFT OUTER JOIN printer
ON product.model = printer.model AND product.type = 'Printer'
WHERE pc.model IS NULL AND laptop.model IS NULL AND printer.model IS NULL;

--2. Намерете всички производители, които правят както лаптопи, така и
--принтери.
SELECT DISTINCT product.maker
FROM product INNER JOIN laptop
ON product.model = laptop.model
WHERE product.maker IN (SELECT product.maker
FROM product INNER JOIN printer
ON product.model = printer.model);

--3. Намерете размерите на тези твърди дискове, които се появяват в два или
--повече модела лаптопи.
SELECT DISTINCT L1.hd
FROM laptop AS L1
WHERE L1.hd IN (SELECT laptop.hd
FROM laptop
WHERE laptop.model != L1.model
)

--4. Намерете всички модели персонални компютри, които нямат регистриран
--производител.
SELECT pc.model
FROM pc LEFT OUTER JOIN product
ON pc.model = product.model
WHERE product.model IS NULL;
