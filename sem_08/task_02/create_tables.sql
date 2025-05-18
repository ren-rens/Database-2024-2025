USE master;
USE rebcho;

--а) Нека създадем мини вариант на Facebook. Искаме да имаме следните
--релации (може да предложите и друг вариант):
-- Users: уникален номер (id), email, парола, дата на регистрация.
-- Friends: двойки от номера на потребители, напр. ако 12 е приятел на 21, 25 и
--40, ще има кортежи (12,21), (12,25), (12,40).
-- Walls: номер на потребител, номер на потребител написал съобщението,
--текст на съобщението, дата.
-- Groups: уникален номер, име, описание (по подразбиране - празен низ).
-- GroupMembers: двойки от вида номер на група - номер на потребител.
--б) Добавете кортежи с примерни данни към новосъздадените релации.

CREATE TABLE USERS
(
ID INT IDENTITY(1,1) UNIQUE NOT NULL,
EMAIL VARCHAR(20),
PASSWD VARCHAR (30),
REGISTRDATE DATE
);

CREATE TABLE FRIENDS
(
FRIEND CHAR(7)
);

CREATE TABLE WALLS
(
RECIEVERID INT ,
WRITERID INT ,
MESSAGEDATA VARCHAR(256),
MESSAGEDATE DATE
);

CREATE TABLE GROUPS
(
ID INT IDENTITY(1, 1) UNIQUE NOT NULL,
GROUPNAME VARCHAR(100),
DESCRIP VARCHAR(100) DEFAULT ''
);

CREATE TABLE GROUPMEMBERS
(
GROUPIDS CHAR(7)
);
