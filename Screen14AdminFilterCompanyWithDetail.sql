-- 1. # CityCovered: unique city-state combination
select comName, count(distinct thCity,thState,comName) as numCityCover from theater
group by comName
having numCityCover between minCity and maxCity;

-- 2. # of different theaters
# no need of distinct because thName and comName are primary key
# Between minTheater and maxTheater
select count(thName) as numTheater from theater
group by comName
having numTheater between minTheater and maxTheater;

-- 3. # of employees in each company
# Between minEmployee and maxEmployee
select comName,count(*) as numEmployee from Employee
group by comName
having numEmployee between minEmployee and maxEmployee;

#testing
select comName, count(distinct thCity,thState,comName) as numCityCover from theater
group by comName
having numCityCover between 1 and 5;

select count(thName) as numTheater from theater
group by comName
having numTheater between 2 and 4;

select comName,count(*) as numEmployee from Manager
group by comName
having numEmployee between 1 and 10;

# join 1,2,3 together
select distinct(theater.comName), a.numCityCover, b.numTheater, c.numEmployee from theater 
join (select comName, count(distinct thCity,thState,comName) as numCityCover from theater group by comName having numCityCover between 1 and 2) as a on theater.comName = a.comName 
join (select comName, count(thName) as numTheater from theater group by comName having numTheater between 1 and 4) as b on theater.comName = b.comName 
join (select comName, count(*) as numEmployee from Manager group by comName having numEmployee between 1 and 3) as c on theater.comName = c.comName;

DROP PROCEDURE IF EXISTS admin_filter_company;
DELIMITER $$
CREATE PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity int, IN i_maxCity int, IN i_minTheater int, IN i_maxTheater int, 
IN i_minEmployee int, IN i_maxEmployee int, IN i_sortBy VARCHAR(50), IN i_sortDirection VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdFilterCom;
    IF (i_minCity is Null) THEN set i_minCity = 0; end if;
	IF (i_minTheater is Null) THEN set i_minTheater = 0; end if;    
	IF (i_minEmployee is Null) THEN set i_minEmployee = 0; end if;    
	IF (i_maxCity is Null) THEN set i_maxCity = 100000; end if;    
	IF (i_maxTheater is Null) THEN set i_maxTheater = 100000; end if;    
	IF (i_maxEmployee is Null) THEN set i_maxEmployee = 100000; end if;
	IF (i_comName = "") THEN set i_comName = "All"; end if;
    
    CREATE TABLE AdFilterCom
	select distinct(a.comName), b.numCityCover, c.numTheater, d.numEmployee from theater as a
	join (select comName, count(distinct thCity,thState,comName) as numCityCover 
			from theater group by comName having numCityCover between i_minCity and i_maxCity) as b on a.comName = b.comName 
	join (select comName, count(thName) as numTheater 
			from theater group by comName having numTheater between i_minTheater and i_maxTheater) as c on a.comName = c.comName 
	join (select comName, count(*) as numEmployee 
			from Manager group by comName having numEmployee between i_minEmployee and i_maxEmployee) as d on a.comName = d.comName
    WHERE 
        (a.comName = i_comName OR i_comName = "ALL" ) AND
        (b.comName = i_comName OR i_comName = "ALL" ) AND
        (c.comName = i_comName OR i_comName = "ALL" ) AND
        (d.comName = i_comName OR i_comName = "ALL" )
	
	Order by  
		(case when i_sortBy = "comName" and i_sortDirection = "ASC" then a.comName end) ASC,
		(case when i_sortBy = "numCityCover" and i_sortDirection = "ASC" then b.numCityCover end) ASC,
		(case when i_sortBy = "numTheater" and i_sortDirection = "ASC" then c.numTheater end) ASC,
		(case when i_sortBy = "numEmployee" and i_sortDirection = "ASC" then d.numEmployee end) ASC,
        (case when i_sortBy = "" and i_sortDirection = "ASC" then a.comName	end) ASC,
        
		(case when i_sortBy = "comName" and (i_sortDirection = "DESC" or i_sortDirection = "") then a.comName end) DESC,
		(case when i_sortBy = "numCityCover" and (i_sortDirection = "DESC" or i_sortDirection = "") then b.numCityCover end) DESC,
		(case when i_sortBy = "numTheater" and (i_sortDirection = "DESC" or i_sortDirection = "") then c.numTheater end) DESC,
		(case when i_sortBy = "numEmployee" and (i_sortDirection = "DESC" or i_sortDirection = "") then d.numEmployee end) DESC,
		(case when i_sortBy = "" and (i_sortDirection = "DESC" or i_sortDirection = "") then a.comName end) DESC;
END$$
DELIMITER ;



call admin_filter_company("AI THeater Company", 1, 10, 1, 10, 1, 10, "numEmployee","ASC");
select*from AdFilterCom;

#Order by  
#		(case 
#			when i_sortBy = "comName" and i_sortDirection = "ASC" then a.comName 
#			when i_sortBy = "numCityCover" and i_sortDirection = "ASC" then b.numCityCover
#			when i_sortBy = "numTheater" and i_sortDirection = "ASC" then c.numTheater
#			when i_sortBy = "numEmployee" and i_sortDirection = "ASC" then d.numEmployee
#			end) ASC,
#		(case 
#			when i_sortBy = "comName" and (i_sortDirection = "DESC" or "") then a.comName
#			when i_sortBy = "numCityCover" and (i_sortDirection = "DESC" or "") then b.numCityCover
#			when i_sortBy = "numTheater" and (i_sortDirection = "DESC" or "") then c.numTheater
#			when i_sortBy = "numEmployee" and (i_sortDirection = "DESC" or "") then d.numEmployee
#			when i_sortBy = "" then a.comName
#			end) DESC;

