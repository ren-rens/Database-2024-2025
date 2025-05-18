USE master
GO

--USE FLIGHTS
--GO

--Изгледи
--За базата от данни Flights:
--1. Създайте изглед, който извежда име на авиокомпания оператор на полета, номер на полет
--и брой пътници, потвърдили резервация за този полет. Тествайте изгледa.
--CREATE VIEW VIEW_FLIGHTS
--AS
--(
--SELECT COUNT(BOOKING.CUSTOMER_ID) AS COUNT_CUSTOMERS, FLIGHT.AIRPLANE, FLIGHT.FLIGHT_TIME
--FROM BOOKING JOIN CUSTOMER
--ON BOOKING.CUSTOMER_ID = CUSTOMER.ID
--JOIN FLIGHT
--ON BOOKING.FLIGHT_NUMBER = FLIGHT.FNUMBER
--GROUP BY FLIGHT.AIRPLANE, FLIGHT.FLIGHT_TIME
--)
--WITH CHECK OPTION;

--2. Създайте изглед, който за всяка агенция извежда името на клиента с най-много
--резервации. Тествайте изгледa.
--CREATE VIEW TOP_CUSTOMER_PER_AGENCY_VIEW
--AS
--(
--SELECT COUNT(CUSTOMER.FIRST_NAME) AS CUSTOMERS_COUNT, AGENCY.NAME
--FROM AGENCY JOIN BOOKING
--ON AGENCY.NAME = BOOKING.AGENCY_NAME
--JOIN CUSTOMER
--ON BOOKING.CUSTOMER_ID = CUSTOMER.ID
--GROUP BY AGENCY.NAME
--ORDER BY COUNT(CUSTOMER.FIRST_NAME)
--);


--3. Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите от град
--София. Дефинирайте изгледa с CHECK OPTION. Тествайте изгледa.
--CREATE VIEW SOFIA_AGENCY_VIEW
--AS(
--SELECT * FROM AGENCY
--WHERE UPPER(AGENCY.CITY) LIKE UPPER('SOFIA'))
--WITH CHECK OPTION;

--4. Създайте изглед за таблицата Agencies, който извежда всички данни за агенциите, такива
--че телефонните номера на тези агенции да имат стойност NULL. Дефинирайте изгледa с
--CHECK OPTION. Тествайте изгледa.
--CREATE VIEW NULL_PHONE_AGENCY AS
--SELECT *
--FROM AGENCY
--WHERE AGENCY.PHONE_NUMBER IS NULL
--WITH CHECK OPTION;

--5. Опитайте се да вмъкнете следните редове през изгледите от задачи 3 и 4. Какво се
----случва?
--INSERT INTO SOFIA_AGENCY_VIEW
--VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');

--INSERT INTO SOFIA_AGENCY_VIEW
--VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');

--INSERT INTO NULL_PHONE_AGENCY
--VALUES('T4 Tour', 'Bulgaria', 'Varna',null);

--6. Кои от горните изгледи са updateable (т.е. върху тях могат да се изпълняват DML
--оператори)?

--7. Изтрийте създадените изгледи.
--DROP VIEW TOP_CUSTOMER_PER_AGENCY_VIEW;

--Индекси
--8. Създайте подходящ/и индекс/и върху таблицата Product от базата от данни PC.
--USE PC
--GO

--CREATE
--INDEX MAKER_IDX
--ON PRODUCT(MAKER);

--SELECT * FROM product;
--9. Създайте подходящи индекси върху таблиците Classes, Ships, Battles, Outcomes от базата
--от данни Ships.
--USE ships
--GO

--SELECT * FROM CLASSES;

--SELECT * FROM SHIPS;
--CREATE
--INDEX CLASS_INDEX
--ON SHIPS(CLASS);

--SELECT * FROM BATTLES;

--SELECT * FROM OUTCOMES;

--CREATE
--INDEX SHIP_INDEX
--ON OUTCOMES(SHIP);
--10. Изтрийте създадените индекси.
--USE SHIPS
--GO
--DROP INDEX SHIP_INDEX ON OUTCOMES;

--DROP INDEX CLASS_INDEX ON SHIPS;
USE PC
GO

DROP INDEX PRODUCT.MAKER_IDX
