DROP PROCEDURE IF EXISTS admin_create_mov;
DELIMITER $$
CREATE PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(200), IN i_movDuration INT,
IN i_movReleaseDate DATE)
BEGIN
   
INSERT INTO Movie(movName,movReleaseDate,duration) 
VALUES (i_movName,i_movReleaseDate,i_movDuration);

END$$
DELIMITER ;
delete from Movie
where duration = 121;

call admin_create_mov("Sicario",121,"2015-08-02");
select * from movie;