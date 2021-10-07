DROP PROCEDURE IF EXISTS admin_view_comDetail_th;
DELIMITER $$
CREATE PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
    DROP TABLE IF EXISTS AdComDetailTh;
    IF (i_comName = "") THEN set i_comName = "All"; end if;
    CREATE TABLE AdComDetailTh
	SELECT thName, manUsername as thManagerUsername, thCity, thState, capacity as thCapacity
    FROM theater WHERE (comName = i_comName OR i_comName = "ALL");
END$$
DELIMITER ;


select*from theater;
select*from user;

call admin_view_comDetail_th("");
select*from adcomdetailth;