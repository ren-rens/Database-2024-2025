
Irena Stancheva <renistancheva81@gmail.com>
Tue 13 May, 11:59 (5 days ago)
to me

USE master
GO

USE FLIGHTS
GO

CREATE TABLE Airline (
    code CHAR(3) PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE Airport (
    code CHAR(3) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    CONSTRAINT unique_airport_name_country UNIQUE (name, country)
);


CREATE TABLE Airplane (
    code VARCHAR(10) PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0),
    year_of_manufacture INT NOT NULL
);


CREATE TABLE Flight (
    flight_number VARCHAR(10) PRIMARY KEY,
    airline_code CHAR(3) NOT NULL,
    departure_airport CHAR(3) NOT NULL,
    arrival_airport CHAR(3) NOT NULL,
    departure_time TIME NOT NULL,
    duration INT NOT NULL,
    airplane_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (airline_code) REFERENCES Airline(code),
    FOREIGN KEY (departure_airport) REFERENCES Airport(code),
    FOREIGN KEY (arrival_airport) REFERENCES Airport(code),
    FOREIGN KEY (airplane_code) REFERENCES Airplane(code)
);


CREATE TABLE Customer (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT chk_email_valid CHECK (
        email LIKE '%@%' AND
        email LIKE '%.%'
    )
);


CREATE TABLE Agency (
    name VARCHAR(100) PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);


CREATE TABLE Booking (
    code INT PRIMARY KEY,
    agency_name VARCHAR(100) NOT NULL,
    airline_code CHAR(3) NOT NULL,
    flight_number VARCHAR(10) NOT NULL,
    customer_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    flight_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status CHAR(1) NOT NULL CHECK (status IN ('0', '1')),
    FOREIGN KEY (agency_name) REFERENCES Agency(name),
    FOREIGN KEY (airline_code) REFERENCES Airline(code),
    FOREIGN KEY (flight_number) REFERENCES Flight(flight_number),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    CONSTRAINT chk_dates CHECK (flight_date >= reservation_date)
);
USE master
GO

USE FLIGHTS
GO

INSERT INTO Airline (code, name, country) VALUES
('BA', 'British Airways', 'United Kingdom'),
('LH', 'Lufthansa', 'Germany'),
('FR', 'Ryanair', 'Ireland');

INSERT INTO Airport (code, name, country, city) VALUES
('LHR', 'Heathrow Airport', 'United Kingdom', 'London'),
('MUC', 'Munich Airport', 'Germany', 'Munich'),
('DUB', 'Dublin Airport', 'Ireland', 'Dublin');

INSERT INTO Airplane (code, type, capacity, year_of_manufacture) VALUES
('A320-001', 'Airbus A320', 180, 2018),
('B737-800', 'Boeing 737-800', 189, 2016),
('A319-003', 'Airbus A319', 144, 2020);


INSERT INTO Flight (flight_number, airline_code, departure_airport, arrival_airport, departure_time, duration, airplane_code) VALUES
('BA123', 'BA', 'LHR', 'MUC', '10:30:00',  120, 'A320-001'),
('LH456', 'LH', 'MUC', 'DUB', '14:15:00',  150, 'B737-800'),
('FR789', 'FR', 'DUB', 'LHR', '18:00:00',  90, 'A319-003');


INSERT INTO Customer (id, first_name, last_name, email) VALUES
(1, 'Ivan', 'Petrov', 'ivan.petrov@example.com'),
(2, 'Maria', 'Ivanova', 'm.ivanova@example.org'),
(3, 'John', 'Doe', 'john.doe@mail.com');

INSERT INTO Agency (name, country, city, phone_number) VALUES
('TravelWorld', 'Bulgaria', 'Sofia', '+359 2 123456'),
('Global Tours', 'Germany', 'Berlin', '+49 30 987654'),
('EuroFly', 'Ireland', 'Dublin', '+353 1 222333');

INSERT INTO Booking (code, agency_name, airline_code, flight_number, customer_id, reservation_date, flight_date, price, status) VALUES
(1001, 'TravelWorld', 'BA', 'BA123', 1, '2025-05-01', '2025-05-10', 220.00, '1'),
(1002, 'Global Tours', 'LH', 'LH456', 2, '2025-04-20', '2025-05-15', 180.50, '1'),
(1003, 'EuroFly', 'FR', 'FR789', 3, '2025-05-05', '2025-05-20', 95.99, '0');
