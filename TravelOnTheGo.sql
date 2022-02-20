Create Database if not exists `TravelOnTheGo`;

-- PASSENGER Table creation

Use `TravelOnTheGo`;
CREATE TABLE if not exists `passenger` (
	passenger_name varchar(100),
	category varchar(100),
	gender varchar(100),
	boarding_city varchar(100),
	destination_city varchar(100),
	distance INT ,
	bus_type varchar(100)
);

-- PRICE Table creation

CREATE TABLE if not exists `price` (
	bus_type varchar(100),
	distance INT ,
	price INT
);


-- Insert into passenger

INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Udit','Non-AC','M','Trivandrum','Panaji',1000,'Sleeper');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting');
INSERT INTO passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type) VALUES('Piyush','AC','M','Pune','Nagpur',700,'Sitting');


-- insert into prices

INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',350,770);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',500,1100);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',600,1300);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',700,1540);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',1000,2220);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',1200,2640);
INSERT INTO price (bus_type, distance, price) VALUES('Sleeper',1500,2700);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',500,620);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',600,744);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',700,868);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',1000,1240);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',1200,1488);
INSERT INTO price (bus_type, distance, price) VALUES('Sitting',1500,1860);


/*
3) How many females and how many male passengers travelled for a minimum distance of
600 KM s?
*/

select count(passenger_name) , gender from `passenger` p where distance >= 600 group by gender ; 

-- 4) Find the minimum ticket price for Sleeper Bus. 

select  * from price where bus_type ='Sleeper' order by price asc limit 1;

-- 5) Select passenger names whose names start with character 'S'

select passenger_name from passenger p where passenger_name like 's%';

/*
6) Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output
*/


select p.passenger_name ,p.boarding_city ,p.destination_city ,p.distance ,p2.price from passenger p join price p2 on p.distance =p2.distance and p.bus_type =p2.bus_type;


/*
7) What are the passenger name/s and his/her ticket price who travelled in the Sitting bus
for a distance of 1000 KM s 
*/

select p.passenger_name ,p2.price from passenger p join price p2 on p.distance =p2.distance and p.bus_type =p2.bus_type where p.distance<=1000 and p.bus_type ='Sitting';

/*
8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?
*/

select p.passenger_name ,p.boarding_city ,p.destination_city ,p2.bus_type ,p2.price from passenger p join price p2 on p.distance =p2.distance where p.passenger_name ='Pallavi' and p.boarding_city ='Panaji' and p.destination_city ='Bengaluru';

/*
9) List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order
*/

select distinct (distance) from passenger p order by distance desc ;

/*
10) Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables 
*/

select passenger_name, distance/sum(distance) As 'percentage of distance travelled' from passenger group by distance;


/*
11) Display the distance, price in three categories in table Price
a) Expensive if the cost is more than 1000
b) Average Cost if the cost is less than 1000 and greater than 500
c) Cheap otherwise
*/


select distance, price,
CASE 
when price>1000 then 'Expensive'
when price>500 and price < 1000 then 'Average Cost'
else 'Cheap'
END AS Verdict from price ;



