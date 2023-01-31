create database train;
use train;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_address VARCHAR(255),
    gender ENUM('M', 'F'),
    ph_no BIGINT,
    dob DATE,
    salary INT
);
CREATE TABLE passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(255),
    seat_no INT,
    gender ENUM('M', 'F'),
    ph_no BIGINT,
    emp_id INT,
    reservation_status VARCHAR(10),
    FOREIGN KEY (emp_id)
        REFERENCES employee (emp_id)
);
CREATE TABLE station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(255),
    no_of_lines INT,
    no_of_platform INT
);
CREATE TABLE trains (
    train_id INT PRIMARY KEY,
    station_id INT,
    train_name VARCHAR(255),
    FOREIGN KEY (station_id)
        REFERENCES station (station_id)
);
CREATE TABLE ticket (
    ticket_no INT PRIMARY KEY,
    source VARCHAR(255),
    destination VARCHAR(255),
    class_id varchar(255),
    fare INT,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES trains (train_id)
);
CREATE TABLE fare (
    receipt_no INT PRIMARY KEY,
    train_id INT,
    source VARCHAR(255),
    destination VARCHAR(255),
    class_id varchar(15),
    fare INT,
    ticket_no INT,
    FOREIGN KEY (train_id)
        REFERENCES trains (train_id)
);
CREATE TABLE class (
    class VARCHAR(255) PRIMARY KEY,
    journey_date DATE,
    no_of_seats INT,
    train_id INT,
    FOREIGN KEY (train_id)
        REFERENCES trains (train_id)
);
        
CREATE TABLE time (
    reference_no INT PRIMARY KEY,
    departure_time TIME,
    arrival_time TIME,
    train_id INT,
    station_id INT,
    FOREIGN KEY (train_id)
        REFERENCES trains (train_id),
    FOREIGN KEY (station_id)
        REFERENCES station (station_id)
);
CREATE TABLE route (
    arrival_time TIME,
    departure_time TIME,
    stop_number INT)
    ;
insert into employee values(1,'Sharath','ABC','M','12345678','2000-02-19',2000),
(2,'Abi','CDE','F','99888222','1999-04-23',2500),
(3,'GK','ASD','M','12325432','2000-09-22',3500),
(4,'SG','DownT','M','621234457','2001-12-12',3000),
(5,'FZ','STRT','F','24368444','1999-03-19',1500);
insert into passenger values(10,'AAAA',25,'M',12345678,2,'Pending'),
(11,'BBBBB',28,'F',21346722,2,'Confirmed'),
(12,'CCCC',24,'M',1232354332,3,'Confirmed'),
(13,'DDDD',31,'F',12222,5,'Pending'),
(14,'DDAD',33,'M',12224,1,'Pending'),
(15,'AAXDDD',30,'F',33422,5,'Confirmed');
insert into station values(111,'Madrid',12,10),
(112,'Cadiz',3,2),
(113,'Catalunya',8,5),
(114,'Sevilla',7,4),
(115,'Ibiza',11,12);
insert into trains values(16626,113,'BarcaEXP'),
(13345,114,'interEXP'),
(15346,111,'specialxp'),
(12123,113,'Local'),
(10212,115,'LuxEXP'),
(11262,111,'RivalEXP');
insert into ticket values(1111,'Madrid','Ibiza','Business Class',200,15346),
(1112,'Sevila','Catulunya','Business Class',150,10212),
(1113,'Madrid','Catulunya','First Class',75,12123),
(1114,'Cadiz','Sevilla','General',30,13345),
(1115,'Catalunya','Ibiza','First Class',80,15346),
(1116,'Sevilla','Ibiza','First Class',100,10212),
(1117,'Madrid','Cadiz','General',45,12123);
insert into fare values(111111,15346,'Madrid','Ibiza','Business Class',200,1111),
(222222,16626,'Barca','Ibiza','Business Class',220,1117),
(333333,15346,'Sevilla','Ibiza','First Class',150,10212),
(444444,16626,'Barca','Ibiza','General',40,1115),
(555555,13345,'Madrid','Barca','Business Class',180,1117),
(666666,15346,'Madrid','Sevilla','General',50,1114),
(777777,12123,'Madrid','Cadiz','General',45,1113);
insert into class values('Business Class','2022-07-12',200,16626),
('First class','2022-07-12',125,16626),
('General','2022-07-12',35,16626);
insert into time values(1,'12:00:00','00:00:00',16626,111),
(2,'12:00:00','00:00:00',15346,112),
(3,'12:00:00','00:00:00',10212,114);
insert into route values('13:00:00','06:30:00',8),
('12:00:00','05:30:00',8),
('13:00:00','08:30:00',8),
('15:00:00','06:30:00',10),
('23:00:00','06:30:00',14);
use train;
SELECT 
    emp_name, gender, salary
FROM
    employee
WHERE
    gender = 'M'
        AND salary > (SELECT 
            MIN(salary)
        FROM
            employee
        WHERE
            gender = 'F');
SELECT 
    passenger_name, gender, reservation_status, emp_id
FROM
    passenger
WHERE
    emp_id = 2;
SELECT 
    train_id, source, destination, class_id, fare
FROM
    fare
WHERE
    source = 'Madrid' AND fare > 75;
SELECT 
    train_id, source, destination, class_id, fare
FROM
    fare
WHERE
    source = 'Madrid'
        AND fare = (SELECT 
            MAX(fare)
        FROM
            fare
        WHERE
            source = 'Madrid');
SELECT 
    station_name, no_of_lines, no_of_platform
FROM
    station
WHERE
    no_of_lines >= 7
        AND no_of_platform >= 10;
SELECT 
    train_id, train_name, station_id
FROM
    trains
WHERE
    station_id <> 111;
SELECT 
    c.class, c.train_id, t.train_name
FROM
    class c
        INNER JOIN
    trains t ON c.train_id = t.train_id;
SELECT 
    e.emp_name,
    e.ph_no,
    p.passenger_name,
    p.gender AS passenger_gender,
    p.reservation_status
FROM
    employee e
        INNER JOIN
    passenger p ON e.emp_id = p.emp_id;
    
    -- 8--
    
SELECT 
    e.emp_name,
    e.ph_no,
    e.gender,
    p.passenger_name,
    p.reservation_status
FROM
    employee e
        JOIN
    passenger p ON e.emp_id = p.emp_id
        AND e.ph_no LIKE '1%8';
        
        -- 9 --
        
SELECT 
    t.station_id,
    t.train_name,
    c.class,
    c.no_of_seats,
    c.journey_date
FROM
    trains t
        JOIN
    class c ON t.train_id = c.train_id
        AND journey_date LIKE '2022%12';
      
      -- 10--

SELECT 
    fare.receipt_no,
    fare.train_id,
    trains.train_name,
    fare.source,
    fare.destination,
    fare.class_id,
    fare.fare,
    ticket.ticket_no,
    time.departure_time,
    time.arrival_time
FROM
    fare
        JOIN
    trains ON fare.train_id = trains.train_id
        JOIN
    ticket ON ticket.ticket_no = fare.ticket_no
        JOIN
    time ON ticket.train_id = time.train_id;


    