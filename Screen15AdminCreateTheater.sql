DROP PROCEDURE IF EXISTS admin_create_theater;
DELIMITER $$
CREATE PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50),
IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2),IN i_thZipcode CHAR(5), 
IN i_capacity int, IN i_managerUsername VARCHAR(50))
proc_label: BEGIN
	IF (i_managerUsername not in (select username from manager where comName = i_comName)) 
    THEN 
    SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only manager working in the company is assigned';
    LEAVE proc_label;
    end if;
	INSERT INTO Theater (thName,comName, capacity, thStreet, thCity, thState, thZipcode, manUsername)
	VALUES (i_thName,i_comName, i_capacity, i_thStreet, i_thCity, i_thState, i_thZipcode, i_managerUsername);

END$$
DELIMITER ;
select 'dfdf'+'ee' from theater;
select conname from manager;
select*from theater;
select*from theater where capacity in (select capacity from theater where capacity=2) and capacity not in (select capacity from theater where thState = 'CA');
delete from theater
where capacity = 10;
call admin_create_theater("Team99922 Movies","AI Theater Company","777 77th street","Houston","To","30318",10,"manager2");
call admin_create_theater("Team77 Movies","AI Theater Company","777 77th street","Houston","TX","30318",10,"ghcghc");

