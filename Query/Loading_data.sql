CREATE TABLE card_holder (
    card_holder_id SERIAL PRIMARY KEY,
    cc_num BIGINT UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender CHAR(1),
    street VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(10),
    zip VARCHAR(10),
    lat FLOAT,
    long FLOAT,
    city_pop INT,
    job VARCHAR(100),
    dob DATE
);

COPY card_holder (cc_num, first_name, last_name, gender, street, city, state, zip, lat, long, city_pop, job, dob)
FROM 'D:/DATA/SQL/Project/card_holder.csv'
DELIMITER ',' CSV HEADER;


CREATE TABLE merchant_location (
    location_id INT PRIMARY KEY,
    merchant_id INT,
    merch_lat DECIMAL(10,6),
    merch_long DECIMAL(10,6),
    merch_zipcode INT
);

COPY merchant_location 
FROM 'D:\DATA\SQL\Project\merchant_location.csv'
DELIMITER ',' CSV HEADER;


CREATE TABLE merchant_info (
    merchant_id INT PRIMARY KEY,
    merchant_name VARCHAR(100),
    category VARCHAR(50)
);

COPY merchant_info
FROM 'D:\DATA\SQL\Project\merchant_info.csv'
DELIMITER ',' CSV HEADER;

CREATE TABLE transaction_info (
    transaction_id SERIAL PRIMARY KEY,
    trans_num VARCHAR(50),
    trans_datetime TIMESTAMP,
    cc_num BIGINT ,
    amount numeric(10,2),
    unix_time BIGINT,
    is_fraud BOOLEAN,
    location_id INT
);


COPY transaction_info (trans_num, trans_datetime, cc_num, amount, unix_time, is_fraud, location_id)
FROM 'D:\DATA\SQL\Project\transaction_info.csv'
DELIMITER ',' CSV HEADER;

