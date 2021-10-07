DROP PROCEDURE IF EXISTS admin_assign_manager;
DELIMITER $$
CREATE PROCEDURE `admin_assign_manager`(IN i_comName VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS AssignManager;
    
create table AssignManager
select username from manager where comName = i_comName and username not in (select manUsername from theater);

END$$
DELIMITER ;
