create database geospatial;
use geospatial;

CREATE TABLE bc_roads (
    gid_r INT PRIMARY KEY,
    road_name CHAR(50),
    the_geom GEOMETRY
);

CREATE TABLE bc_municipality (
    gid_m INT,
    code INT UNIQUE,
    city_name CHAR(25),
    geom GEOMETRY
);

insert into bc_roads values(1120,'Outer-ring road',ST_GeomFromText('LINESTRING(2 1, 6 6,10 10)')),
(1121,'Inner-ring road',ST_GeomFromText('LINESTRING(0 0, 10 10,20 25)')),
(1122,'XYZ road',ST_GeomFromText('LINESTRING(10 10, 15 15,25 25)'));


 
 insert into bc_municipality values (11,1,"Madrid",ST_GeomFromText('POLYGON((0 5, 2 5, 2 7, 0 7, 0 5))')),
     (12,2,"Barcelona",ST_GeomFromText('POLYGON((0 5, 2 5, 2 8, 0 8, 0 5))')),
     (13,3,"Sevilla",ST_GeomFromText('POLYGON((0 5, 2 5, 2 9, 0 9, 0 5))'));  
	
select * from bc_municipality;

SELECT 
    SUM(ST_LENGTH(the_geom)) / 1000 AS road_length_km
FROM
    bc_roads;

 