#1
CREATE TABLE User
(username	VARCHAR(30)					NOT NULL,
 status 	Enum("Pending", "Declined", "Approved")		NOT NULL,
 password	VARCHAR(60)					NOT NULL,
 firstname	VARCHAR(30)					NOT NULL,
 lastname	VARCHAR(30)					NOT NULL,
 userType        VARCHAR(30)					 NOT NULL,
 PRIMARY KEY(username),
 check (LENGTH(password)>7));

#2
CREATE TABLE Employee
	(username	VARCHAR(30)					NOT NULL,
	 employeeType VARCHAR(30)					NOT NULL,
	FOREIGN KEY(username) REFERENCES User(username)
				ON DELETE Cascade	 ON UPDATE Cascade);
                
#3
CREATE TABLE Company
	(comName	VARCHAR(40)				NOT NULL,
	 PRIMARY KEY(comName));

#4
CREATE TABLE Admin
	(username	VARCHAR(30)					NOT NULL,
	 PRIMARY KEY(username),
	 FOREIGN KEY(username) REFERENCES Employee(username)
				ON DELETE Cascade	 ON UPDATE Cascade);
                
#5
CREATE TABLE Manager
	(username		VARCHAR(30)					NOT NULL,
	comName	VARCHAR(30)					NOT NULL,
 	 manStreet	VARCHAR(30)					NOT NULL,
 manCity		VARCHAR(30)					NOT NULL,
 manState	CHAR(2)						NOT NULL,
manZipcode	CHAR(5)						NOT NULL,

	 PRIMARY KEY(username),
	 UNIQUE KEY(manStreet, manCity, manState, manZipcode),
	 FOREIGN KEY (username) REFERENCES Employee(username)
				ON DELETE Cascade	ON UPDATE Cascade,
 FOREIGN KEY (comName) REFERENCES Company(comName)
			ON DELETE Cascade 	ON UPDATE Cascade);
            
#6
 CREATE TABLE Customer
	(username	VARCHAR(30)					NOT NULL,
	PRIMARY KEY(username),
FOREIGN KEY(username) REFERENCES User(username)
			ON DELETE Cascade           ON UPDATE Cascade);

#7
CREATE TABLE CustomerCreditCard
	(creditCardNum	CHAR(16)					NOT NULL,
	 username		VARCHAR(30)				NOT NULL,
	 PRIMARY KEY(creditCardNum),
	 FOREIGN KEY(username) REFERENCES Customer(username)
			ON DELETE Cascade	ON UPDATE Cascade,
CHECK (LENGTH(creditCardNum) = 16));



#8
CREATE TABLE Movie
	(movName		VARCHAR(200)				NOT NULL,
	 movReleaseDate	DATE						NOT NULL,
	 duration		INT						NOT NULL,

	 PRIMARY KEY(movName,movReleaseDate),
 CHECK (duration>0));
 

#9
CREATE TABLE Theater
	(thName          VARCHAR(30)					NOT NULL,
 comName       VARCHAR(30)					NOT NULL,
 capacity                  INT						NOT NULL,
 thStreet           VARCHAR(30)					NOT NULL,
 thCity              VARCHAR(30)					NOT NULL,
	 thState           CHAR(2)						NOT NULL,
	 thZipcode        CHAR(5)					NOT NULL,
	 manUsername   VARCHAR(30)					NOT NULL unique,
	
PRIMARY KEY(comName, thName),
	FOREIGN KEY(comName) REFERENCES Company(comName)
ON DELETE Cascade             ON UPDATE Cascade,
	FOREIGN KEY(manUsername) REFERENCES Manager(username)
				ON DELETE Cascade            ON UPDATE Cascade,
CHECK (Capacity > 0));

#10
CREATE TABLE MoviePlay
	(thName		VARCHAR(30)				NOT NULL,
 comName	VARCHAR(30)				NOT NULL,
	 movName		VARCHAR(200)				NOT NULL,
	 movReleaseDate	DATE						NOT NULL,
	 movPlayDate	DATE			   			NOT NULL,
PRIMARY KEY(thName, comName, movName, movReleaseDate, movPlayDate),
FOREIGN KEY (comName, thName) REFERENCES 	Theater(comName, thName)
			ON DELETE Cascade	ON UPDATE Cascade,
FOREIGN KEY (movName, movReleaseDate) REFERENCES 	Movie(movName, movReleaseDate)
				ON DELETE Cascade	ON UPDATE Cascade);

#11
CREATE TABLE CustomerViewMovie
	(creditCardNum         CHAR(16)          			        NOT NULL,
 thName             VARCHAR(30)			        	        NOT NULL,
 	 comName          VARCHAR(30)			        NOT NULL,
	 movName               VARCHAR(200)			        NOT NULL,
	 movReleaseDate    DATE					        NOT NULL,
	 movPlayDate          DATE					        NOT NULL,
PRIMARY KEY(creditCardNum, thName, comName, movName, movReleaseDate, movPlayDate),
	FOREIGN KEY(creditCardNum) REFERENCES CustomerCreditCard(creditCardNum)
				ON DELETE Restrict           ON UPDATE Restrict,
FOREIGN KEY(thName, comName, movName, movReleaseDate, movPlayDate) REFERENCES MoviePlay(thName, comName, movName,  movReleaseDate, movPlayDate)
				ON DELETE Restrict	ON UPDATE Restrict,
CHECK (LENGTH(creditCardNum) = 16));

#12
CREATE TABLE UserVisitTheater
	(visitID                        INT                        		        	         NOT NULL,
	 
	 username		VARCHAR(30)			         NOT NULL,
 thName		VARCHAR(30)   		                     NOT NULL,
 	 comName	VARCHAR(30)			         NOT NULL,
visitDate		Date		 		         	         NOT NULL,
	 PRIMARY KEY(visitID),
	 FOREIGN KEY(username) 		REFERENCES 	User(username) 
				ON DELETE Cascade          ON UPDATE Cascade,
 FOREIGN KEY(comName,thName) 	    REFERENCES 
 Theater(comName,thName)
ON DELETE  Restrict        ON UPDATE Restrict);
