---1. Напишете заявка, която извежда производителя и честотата на лаптопите с
---размер на диска поне 9 GB.
SELECT maker, speed
FROM product JOIN laptop
ON product.model = laptop.model
WHERE UPPER(product.type) LIKE UPPER('Laptop')
AND laptop.HD >= 9;

---2. Напишете заявка, която извежда модел и цена на продуктите, произведени от
---производител с име B.
SELECT product.model, pc.price
FROM product JOIN pc
ON pc.model = product.model
WHERE product.maker = 'B' AND UPPER(product.type) LIKE UPPER('PC')

UNION 

SELECT product.model, laptop.price
FROM laptop JOIN product
ON laptop.model = product.model
WHERE product.maker = 'B' AND UPPER(product.type) LIKE UPPER('Laptop')

UNION 

SELECT product.model, printer.price
FROM printer JOIN product
ON printer.model = product.model
WHERE product.maker = 'B' AND UPPER(product.type) LIKE UPPER('Printer');

---3. Напишете заявка, която извежда производителите, които произвеждат лаптопи,
---но не произвеждат персонални компютри.
(SELECT product.maker
FROM product, laptop
WHERE product.model = laptop.model)

EXCEPT

(SELECT product.maker
FROM product, pc
WHERE product.model = pc. model);

---4. Напишете заявка, която извежда размерите на тези дискове, които се предлагат
---в поне два различни персонални компютъра (два компютъра с различен код).
SELECT DISTINCT PC1.hd
FROM pc AS PC1, pc AS PC2
WHERE PC1.code != PC2.code AND PC1.hd = PC2.hd;

---5. Напишете заявка, която извежда двойките модели на персонални компютри,
---които имат еднаква честота и памет. Двойките трябва да се показват само по
---веднъж, например само (i, j), но не и (j, i).
SELECT DISTINCT PC1.model, PC2.model
FROM pc AS PC1 JOIN pc AS PC2
ON PC1.model < PC2.model
WHERE PC1.speed = PC2.speed AND PC1.RAM = PC2.RAM;

---6. Напишете заявка, която извежда производителите на поне два различни
---персонални компютъра с честота поне 400.
SELECT DISTINCT maker
FROM product, pc as PC1, pc as PC2
WHERE PC1.code != PC2.code AND
PC1.speed >= 400 AND
PC1.model = product.model AND
PC2.model = PC1.model;
