---1. Напишете заявка, която извежда производителите на персонални
---компютри с честота над 500.
SELECT maker
FROM product
WHERE product.model IN (SELECT pc.model
                        FROM pc
                        WHERE pc.speed > 500);

---2. Напишете заявка, която извежда код, модел и цена на принтерите с найвисока цена.
SELECT code, model, price
FROM printer
WHERE price >= ALL (SELECT price
                  FROM printer);
---3. Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от
---честотата на всички персонални компютри.
SELECT *
FROM laptop
WHERE laptop.speed < ALL (SELECT pc.speed
                          FROM pc);
                          
---4. Напишете заявка, която извежда модела и цената на продукта (PC,
---лаптоп или принтер) с най-висока цена.
SELECT TOP 1 model, price
FROM (
      (SELECT pc.model, pc.price
      FROM pc) 
      
      UNION
      
      (SELECT laptop.model, laptop.price
      FROM laptop)
      
      UNION
      
      (SELECT printer.model, printer.price
      FROM printer)
      ) AS t
ORDER BY price DESC


---5. Напишете заявка, която извежда производителя на цветния принтер с
---най-ниска цена.
SELECT TOP 1 maker
FROM product, printer
WHERE product.model = printer.model AND 
printer.price <= ALL(SELECT printer.price
                    FROM printer
                    WHERE printer.color = 'Y');

---6. Напишете заявка, която извежда производителите на тези персонални
---компютри с най-малко RAM памет, които имат най-бързи процесори
SELECT DISTINCT maker
FROM product
WHERE product.model IN 
(SELECT pc.model
FROM pc
WHERE pc.speed = (SELECT TOP 1 pc.speed
                  FROM pc
                  WHERE pc.RAM <= ALL(
                                      SELECT pc.RAM
                                      FROM pc
                                      )
                  ORDER BY pc.speed DESC
                  )
);
