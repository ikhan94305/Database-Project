# INSERTION CODES

INSERT INTO User(username, status, password, firstname, lastname, userType)  
VALUES("georgep","Approved","111111111","George P.","Burdell","Employee, Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("calcwizard","Approved","222222222","Issac","Newton","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("calcultron","Approved","333333333","Dwight","Schrute","Employee, Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("calcultron2","Approved","444444444","Jim","Halpert","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("gdanger","Declined","555555555","Gary","Danger","User");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("imbatman","Approved","666666666","Bruce","Wayne","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("imready","Approved","777777777","Spongebob","Squarepants","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("isthisthekrustykrab","Approved","888888888","Patrick","Star","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("clarinetbeast","Declined","999999999","Squidward","Tentacles","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("texasStarKarate","Declined","111111110","Sandy","Cheeks","User");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("fullMetal","Approved","111111100","Edward","Elric","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("notFullMetal","Approved","111111100","Alphonse","Elric","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("ilikemoney$$","Approved","111111110","Eugene","Krabs","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("eeqmcsquare","Approved","111111110","Albert","Einstein","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("theScienceGuy","Approved","999999999","Bill","Nye","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("entropyRox","Approved","999999999","Claude","Shannon","Employee, Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("fatherAI","Approved","222222222","Alan","Turing","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("cool_class4400","Approved","333333333","A. TA","Washere","Employee, Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("thePiGuy3.14","Approved","1111111111","Archimedes","Syracuse","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("does2Much","Approved","1212121212","Carl","Gauss","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("programerAAL","Approved","3131313131","Ada","Lovelace","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("radioactivePoRa","Approved","1313131313","Marie","Curie","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("DNAhelix","Approved","777777777","Rosalind","Franklin","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("ghcghc","Approved","666666666","Grace","Hopper","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("RitzLover28","Approved","444444444","Abby","Normal","Customer");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("smith_j","Pending","333333333","John","Smith","User");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("manager1","Approved","1122112211","Manager","One","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("manager2","Approved","3131313131","Manager","Two","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("manager3","Approved","8787878787","Three","Three","Employee");
INSERT INTO User(username, status, password, firstname, lastname, userType)  VALUES("manager4","Approved","5755555555","Four","Four","Employee");


#Employee
INSERT INTO Employee( username,employeeType ) VALUES("cool_class4400","Admin");
INSERT INTO Employee( username,employeeType ) VALUES("entropyRox","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("fatherAI","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("georgep","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("calcultron","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("imbatman","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("ghcghc","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("radioactivePoRa","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("manager1","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("manager2","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("manager3","Manager");
INSERT INTO Employee( username,employeeType ) VALUES("manager4","Manager");


#Company - 확인완료
INSERT INTO Company(comName) VALUES ("EZ Theater Company");
INSERT INTO Company(comName) VALUES ("4400 Theater Company");
INSERT INTO Company(comName) VALUES ("Awesome Theater Company");
INSERT INTO Company(comName) VALUES ("AI Theater Company");


#Admin - 확인완료
insert into Admin(username) values("cool_class4400");


#Manager - 확인완료
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("entropyRox","4400 Theater Company","200 Cool Place", "San Francisco", "CA","94016");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("fatherAI","EZ Theater Company","456 Main St","New York","NY","10001");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("georgep","4400 Theater Company","10 Pearl Dr","Seattle","WA","98105");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("calcultron","EZ Theater Company","123 Peachtree St","Atlanta","GA","30308");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("imbatman","Awesome Theater Company","800 Color Dr","Austin","TX","78653");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("ghcghc","AI Theater Company","100 Pi St","Pallet Town","KS","31415");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("radioactivePoRa","4400 Theater Company","100 Blu St","Sunnyvale","CA","94088");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("manager1","4400 Theater Company","123 Ferst Drive","Atlanta","GA","30332");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("manager2","AI Theater Company","456 Ferst Drive","Atlanta","GA","30332");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("manager3","4400 Theater Company","789 Ferst Drive","Atlanta","GA","30332");
INSERT INTO Manager(username, comName, manStreet, manCity, manState, manZipcode) VALUES ("manager4","4400 Theater Company","000 Ferst Drive","Atlanta","GA","30332");


#Customer - 확인완료
insert into Customer(username) values("georgep");
insert into Customer(username) values("calcwizard");
insert into Customer(username) values("calcultron");
insert into Customer(username) values("calcultron2");
insert into Customer(username) values("imready");
insert into Customer(username) values("isthisthekrustykrab");
insert into Customer(username) values("clarinetbeast");
insert into Customer(username) values("fullMetal");
insert into Customer(username) values("notFullMetal");
insert into Customer(username) values("ilikemoney$$");
insert into Customer(username) values("eeqmcsquare");
insert into Customer(username) values("theScienceGuy");
insert into Customer(username) values("entropyRox");
insert into Customer(username) values("cool_class4400");
insert into Customer(username) values("thePiGuy3.14");
insert into Customer(username) values("does2Much");
insert into Customer(username) values("programerAAL");
insert into Customer(username) values("DNAhelix");
insert into Customer(username) values("RitzLover28");

#CustomerCreditCard - 확인완료
insert into CustomerCreditCard(creditCardNum, username) values("1111111111111111","georgep");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111111110","georgep");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111111100","georgep");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111111000","georgep");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111110000","georgep");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111100000","calcwizard");
insert into CustomerCreditCard(creditCardNum, username) values("1111111111000000","calcultron");
insert into CustomerCreditCard(creditCardNum, username) values("1111111110000000","calcultron2");
insert into CustomerCreditCard(creditCardNum, username) values("1111111100000000","calcultron2");
insert into CustomerCreditCard(creditCardNum, username) values("1111110000000000","imready");
insert into CustomerCreditCard(creditCardNum, username) values("1111100000000000","isthisthekrustykrab");
insert into CustomerCreditCard(creditCardNum, username) values("1111000000000000","isthisthekrustykrab");
insert into CustomerCreditCard(creditCardNum, username) values("1110000000000000","isthisthekrustykrab");
insert into CustomerCreditCard(creditCardNum, username) values("1100000000000000","fullMetal");
insert into CustomerCreditCard(creditCardNum, username) values("1000000000000000","notFullMetal");
insert into CustomerCreditCard(creditCardNum, username)  values("9000000000000000","ilikemoney$$");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222222222","ilikemoney$$");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222222220","ilikemoney$$");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222222200","eeqmcsquare");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222222000","theScienceGuy");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222220000","entropyRox");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222200000","entropyRox");
insert into CustomerCreditCard(creditCardNum, username) values("2222222222000000","cool_class4400");
insert into CustomerCreditCard(creditCardNum, username) values("2222222220000000","thePiGuy3.14");
insert into CustomerCreditCard(creditCardNum, username) values("2222222200000000","does2Much");
insert into CustomerCreditCard(creditCardNum, username) values("2222222000000000","programerAAL");
insert into CustomerCreditCard(creditCardNum, username) values("2220000000000000","DNAhelix");
insert into CustomerCreditCard(creditCardNum, username) values("3333333333333300","RitzLover28");

#Movie- 확인완료
insert into Movie(movName,movReleaseDate,duration) values("How to Train Your Dragon","2010-03-21",98);
insert into Movie(movName,movReleaseDate,duration) values("4400 The Movie","2019-08-12",130);
insert into Movie(movName,movReleaseDate,duration) values("The First Pokemon Movie","1998-07-19",75);
insert into Movie(movName,movReleaseDate,duration) values("The King\'s Speech","2010-11-26",119);
insert into Movie(movName,movReleaseDate,duration) values("Avengers: Endgame","2019-04-26",181);
insert into Movie(movName,movReleaseDate,duration) values("Spaceballs","1987-06-24",96);
insert into Movie(movName,movReleaseDate,duration) values("Spider-Man: Into the Spider-Verse","2018-12-01",117);
insert into Movie(movName,movReleaseDate,duration) values("Georgia Tech The Movie","1985-08-13",100);
insert into Movie(movName,movReleaseDate,duration) values("George P Burdell\'s Life Story","1927-08-12",100);
insert into Movie(movName,movReleaseDate,duration) values("Calculus Returns: A ML Story","2019-09-19",314);

#Theater - 확인완료
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("Main Movies","EZ Theater Company",3, "123 Main St","New York","NY","10001","fatherAI");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("Star Movies","EZ Theater Company",2, "745 GT St","Atlanta","GA","30332","calcultron");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("Cinema Star","4400 Theater Company",4, "100 Cool Place","San Francisco","CA","94016","entropyRox");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("Star Movies","4400 Theater Company",5, "4400 Rocks Ave","Boulder","CA","80301","radioactivePoRa");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("Jonathan\'s Movies","4400 Theater Company",2,"67 Pearl Dr","Seattle","WA","98101","georgep");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("ABC Theater","Awesome Theater Company",5,"880 Color Dr","Austin","TX","73301","imbatman");
INSERT INTO Theater(thName,comName,capacity,thStreet,thCity,thState,thZipcode,manUsername) VALUES("ML Movies","AI Theater Company",3,"314 Pi St","Pallet Town","KS","31415","ghcghc");

# MoviePlay
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ABC Theater","Awesome Theater Company","4400 The Movie","2019-08-12","2019-10-12");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ABC Theater","Awesome Theater Company","The First Pokemon Movie","1998-07-19","2018-07-19");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ABC Theater","Awesome Theater Company","Georgia Tech The Movie","1985-08-13","1985-08-13");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","How to Train Your Dragon","2010-03-21","2010-04-02");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","4400 The Movie","2019-08-12","2019-09-12");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","The King\'s Speech","2010-11-26","2019-12-20");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","Spaceballs","1987-06-24","2000-02-02");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","Georgia Tech The Movie","1985-08-13","2019-09-30");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Cinema Star","4400 Theater Company","George P Burdell\'s Life Story","1927-08-12","2010-05-20");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-22");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-23");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","Spaceballs","1987-06-24","1999-06-24");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","George P Burdell\'s Life Story","1927-08-12","2019-10-22");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","George P Burdell\'s Life Story","1927-08-12","2019-07-14");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Main Movies","EZ Theater Company","The King\'s Speech","2010-11-26","2019-12-20");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ML Movies","AI Theater Company","Spaceballs","1987-06-24","2010-04-02");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ML Movies","AI Theater Company","Spaceballs","1987-06-24","2023-01-23");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ML Movies","AI Theater Company","Calculus Returns: A ML Story","2019-09-19","2019-10-10");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ML Movies","AI Theater Company","Calculus Returns: A ML Story","2019-09-19","2019-12-30");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("ML Movies","AI Theater Company","Spider-Man: Into the Spider-Verse","2018-12-01","2019-09-30");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Star Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-25");
insert into MoviePlay(thName, comName, movName, movReleaseDate, movPlayDate) values("Star Movies","EZ Theater Company","4400 The Movie","2019-08-12","2019-08-12");

# CustomerViewMovie
insert into CustomerViewMovie(creditCardNum, thName, comName, movName, movReleaseDate, movPlayDate) values("1111111111111111","Cinema Star","4400 Theater Company","How to Train Your Dragon","2010-03-21","2010-04-02");
insert into CustomerViewMovie(creditCardNum, thName, comName, movName, movReleaseDate, movPlayDate) values("1111111111111111","Main Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-22");
insert into CustomerViewMovie(creditCardNum, thName, comName, movName, movReleaseDate, movPlayDate) values("1111111111111111","Main Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-23");
insert into CustomerViewMovie(creditCardNum, thName, comName, movName, movReleaseDate, movPlayDate) values("1111111111111100","Star Movies","EZ Theater Company","How to Train Your Dragon","2010-03-21","2010-03-25");


# UserVisitTheater
insert into UserVisitTheater(visitID, username, thName, comName, visitDate) values(1,"georgep","Main Movies","EZ Theater Company","2010-03-22");
insert into UserVisitTheater(visitID, username, thName, comName, visitDate) values(2,"calcwizard","Main Movies","EZ Theater Company","2010-3-22");
insert into UserVisitTheater(visitID, username, thName, comName, visitDate) values(3,"calcwizard","Star Movies","EZ Theater Company","2010-3-22");
insert into UserVisitTheater(visitID, username, thName, comName, visitDate) values(4,"imready","Star Movies","EZ Theater Company","2010-3-22");
insert into UserVisitTheater(visitID, username, thName, comName, visitDate) values(5,"calcwizard","ML Movies","AI Theater Company","2010-3-22");
