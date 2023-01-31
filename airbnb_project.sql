create database airbnb;
use airbnb;
CREATE TABLE airbnb_hosts (
    host_id INT PRIMARY KEY,
    host_name VARCHAR(150),
    host_since DATE,
    host_location VARCHAR(150),
    host_response_time VARCHAR(200),
    host_response_rate INT,
    host_acceptance_rate INT,
    host_is_superhost BOOLEAN,
    host_neighbourhood VARCHAR(100),
    host_listings_count INT,
    host_has_profile_pic BOOLEAN,
    host_identity_verified BOOLEAN
);
CREATE TABLE listings (
    listing_id INT PRIMARY KEY,
    listing_name VARCHAR(100),
    street VARCHAR(300),
    neighbourhood_cleansed VARCHAR(150),
    neighbourhood_group_cleansed VARCHAR(150),
    city VARCHAR(150),
    state VARCHAR(5),
    zipcode VARCHAR(20),
    latitude FLOAT,
    longitude FLOAT,
    is_location_exact BOOLEAN,
    property_type VARCHAR(150),
    room_type VARCHAR(150),
    accommodates INT,
    bathrooms INT,
    bedrooms INT,
    beds INT,
    bed_type VARCHAR(200),
    square_feet INT,
    price FLOAT,
    weekly_price FLOAT,
    monthly_price FLOAT,
    security_deposit FLOAT,
    cleaning_fee FLOAT,
    guests_included INT,
    extra_people FLOAT,
    minimum_nights INT,
    maximum_nights INT,
    has_availability BOOLEAN,
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    calendar_updated DATE,
    number_of_reviews INT,
    first_review DATE,
    last_review DATE,
    review_scores_rating INT,
    review_scores_accuracy INT,
    review_scores_cleanliness INT,
    review_scores_checkin INT,
    review_scores_communication INT,
    review_scores_location INT,
    review_scores_value INT,
    requires_license BOOLEAN,
    instant_bookable BOOLEAN,
    cancellation_policy VARCHAR(200),
    require_guest_profile_picture BOOLEAN,
    require_guest_phone_verification BOOLEAN,
    reviews_per_month FLOAT,
    host_id INT,
    FOREIGN KEY (host_id)
        REFERENCES airbnb_hosts (host_id)
        ON DELETE CASCADE
);
CREATE TABLE property_availability (
    property_id INT NOT NULL AUTO_INCREMENT,
    listing_id INT,
    available_date DATE,
    available BOOLEAN,
    price FLOAT,
    PRIMARY KEY(property_id),
    FOREIGN KEY(listing_id) REFERENCES listings(listing_id) ON DELETE CASCADE
);
CREATE TABLE property_review (
    review_id INT,
    listing_id INT,
    review_date DATE,
    reviewer_id INT,
    reviewer_name VARCHAR(100),
    comments MEDIUMTEXT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (listing_id)
        REFERENCES listings (listing_id)
        ON DELETE CASCADE
);
insert into airbnb_hosts values(1,'Sanju','2022-01-09','Kochi','within a hour',78,70,True,'Marriot',2,True,True),
(2,'Shyam','2022-01-09','Trivandrum','quick',100,100,True,'Meridean',5,True,True),
(3,'Arun','2022-01-09','Alappuzha','within a fews hours',60,45,True,'Hayat',3,True,True);

insert into listings values(1012,'A/C dble','Monroe',NULL,NULL,'Alappuzha','KL','678532','39.31239','-149.91784',True,'Cottage','A/C double',3,1,2,2,'Double',1000,4000,15000,45000,0,0,2,2,1,30,True,5,0,0,0,'2020-01-21',50,'2020-01-25','2022-09-23',4,89,4,4,4,4,4,True,True,'Available',
False,False,21,3),
(1013,'A/C','Cherai',NULL,NULL,'Kochi','KL','678532','39.31239','-149.91784',True,'Cottage','A/C double',3,1,2,2,'Double',1000,6000,15000,45000,0,0,2,2,1,30,True,5,0,0,0,'2020-01-21',50,'2020-01-25','2022-09-23',4,89,4,4,4,4,4,True,True,'Available',
False,False,21,1),
(1014,'Non A/C','Kovalam',NULL,NULL,'Trivandrum','KL','678532','39.31239','-149.91784',True,'Cottage','A/C double',3,1,2,2,'Double',1000,4500,15000,45000,0,0,2,2,1,30,True,5,0,0,0,'2020-01-21',50,'2020-01-25','2022-09-23',4,89,4,4,4,4,4,True,True,'Available',
False,False,21,2),
(1015,'A/C dble','Aroor',NULL,NULL,'Alappuzha','KL','678532','56.31239','-149.91784',True,'Cottage','A/C double',3,1,2,2,'Double',1000,5000,15000,45000,0,0,2,2,1,30,True,5,0,0,0,'2020-01-21',50,'2020-01-25','2022-09-23',4,89,4,4,4,4,4,True,True,'Available',
False,False,21,3),
(1016,'A/C dble','Vembandu',NULL,NULL,'Alappuzha','KL','678532','39.56239','-149.91784',True,'Cottage','A/C double',3,1,2,2,'Double',1000,2000,15000,45000,0,0,2,2,1,30,True,5,0,0,0,'2020-01-21',50,'2020-01-25','2022-09-23',4,89,4,4,4,4,4,True,True,'Available',
False,False,21,3);

insert into property_availability values(11,1014,'2022-12-25',True,6000),
(12,1012,'2022-12-27',True,6250),
(13,1013,'2022-12-23',False,4500),
(14,1015,'2022-12-29',True,6500),
(15,1012,'2022-12-28',True,5000),
(16,1012,'2022-12-22',True,4500);
insert into property_review values(1101,1013,'2022-11-26',2120,'Antony','Good'),
(1102,1014,'2022-11-23',2121,'Ashayr','Good'),
(1103,1012,'2022-11-26',2122,'Gopi','Great'),
(1104,1013,'2022-11-19',2123,'Hari','Good'),
(1105,1015,'2022-11-21',2124,'Donald','Average');

SELECT 
    AVG(price)
FROM
    listings;
SELECT 
    h.host_id,
    h.host_name,
    h.host_location,
    l.listing_name,
    l.street,
    l.state
FROM
    airbnb_hosts h
        JOIN
    listings l ON h.host_id = l.host_id;
SELECT 
    beds, bedrooms, bed_type
FROM
    listings;
SELECT 
    AVG(price)
FROM
    property_availability;
 SELECT 
    a.price, a.available_date, r.review_date, r.reviewer_name
FROM
    property_availability a
        LEFT JOIN
    property_review r ON a.listing_id = r.listing_id;
    SELECT 
    listing_id, review_id, reviewer_id
FROM
    property_review;
SELECT 
    review_scores_rating,
    review_scores_accuracy,
    review_scores_cleanliness,
    review_scores_checkin,
    review_scores_communication,
    review_scores_location
FROM
    listings;