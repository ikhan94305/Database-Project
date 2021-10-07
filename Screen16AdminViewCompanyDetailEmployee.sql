DROP PROCEDURE IF EXISTS admin_view_comDetail_emp;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailEmp;
    IF (i_comName = "") THEN set i_comName = "All"; end if;
    CREATE TABLE AdComDetailEmp
	SELECT firstname as empFirstname, lastname as empLastname
    FROM user where username in
   (SELECT username FROM manager where (comName = i_comName OR i_comName = "ALL"));
END$$
DELIMITER ;


select*from manager;
select*from user;

call admin_view_comDetail_emp("ALL");
select*from adcomdetailemp;