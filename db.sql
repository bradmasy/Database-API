-- Drop Database if it exist
DROP DATABASE IF EXISTS COV_TEOD;

-- Create DB if not exist
CREATE DATABASE IF NOT EXISTS COV_TEOD;
-- Select DB
use COV_TEOD;  

-- Create SPAN if not exist
CREATE TABLE IF NOT EXISTS SPAN(
    ID int NOT NULL AUTO_INCREMENT,
    BOUNDARY_STREET_ONE VARCHAR(30),
    BOUNDARY_STREET_TWO VARCHAR(30),
    PRIMARY KEY (ID)
);

-- Create Burial Method if not exist
CREATE TABLE IF NOT EXISTS BURIAL_METHOD (
    ID INT NOT NULL AUTO_INCREMENT, 
    METHOD VARCHAR(30) NOT NULL,
    PRIMARY KEY (ID)
);

-- Create Material Table if not exist
CREATE TABLE IF NOT EXISTS MATERIAL(
    ID int NOT NULL AUTO_INCREMENT, 
    MATERIAL_TYPE VARCHAR(30),
    PRIMARY KEY (ID)
);

-- Create Wire Set 
CREATE TABLE IF NOT EXISTS WIRE_SET(
    ID int NOT NULL AUTO_INCREMENT,
    CODE VARCHAR(30),
    WIRE_TYPE VARCHAR(30),
    PRIMARY KEY (ID)
);

-- Create Contractors
CREATE TABLE IF NOT EXISTS CONTRACTOR(
    ID INT NOT NULL AUTO_INCREMENT, 
    COMPANY_NAME VARCHAR(100), 
    START_DATE DATE,
    PRIMARY KEY(ID)
);

-- Create Conduit
CREATE TABLE IF NOT EXISTS CONDUIT(
    ID int NOT NULL AUTO_INCREMENT,
    SPAN_ID int NOT NULL,
    BURIAL_METHOD_ID int NOT NULL,
    SIZE float NOT NULL,
    LAST_MAINTAINED date NOT NULL,
    INSTALL_DATE date NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (SPAN_ID) REFERENCES SPAN(ID) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (BURIAL_METHOD_ID) REFERENCES BURIAL_METHOD(ID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Maintanence 
CREATE TABLE IF NOT EXISTS MAINTANENCE(
    CONDUIT_ID INT NOT NULL,
    CONTRACTOR_ID INT NOT NULL, 
    START_DATE DATE, 
    FINISH_DATE DATE,
    PRIMARY KEY (CONDUIT_ID, CONTRACTOR_ID),
    FOREIGN KEY (CONDUIT_ID) REFERENCES CONDUIT(ID) ON UPDATE CASCADE ON DELETE CASCADE, 
    FOREIGN KEY (CONTRACTOR_ID) REFERENCES CONTRACTOR(ID) ON UPDATE CASCADE ON DELETE CASCADE
);