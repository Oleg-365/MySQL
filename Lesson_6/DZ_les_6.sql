DROP DATABASE IF EXISTS Dz_les_6;
CREATE DATABASE IF NOT EXISTS Dz_les_6;
USE Dz_les_6;

-- Task_1
DELIMITER //
CREATE PROCEDURE TimeData(num INT)
BEGIN
  SELECT CONCAT(CAST(FLOOR(num/60/60/24) AS CHAR(3)),' days ',
      CAST(FLOOR(MOD(num/60/60/24,1)*24) AS CHAR(2)),' hours ',
      CAST(FLOOR(MOD(MOD(num/60/60/24,1)*24,1)*60) AS CHAR(2)),' minutes ',
      CAST(ROUND(MOD(MOD(MOD(num/60/60/24,1)*24,1)*60,1)*60) AS CHAR(2)), ' seconds ') AS 'time output'
  from dual;
END //
DELIMITER ;
CALL TimeData(123456);


-- Task_2
DELIMITER // 
CREATE FUNCTION input_even (num INT) 
RETURNS VARCHAR(256) 
DETERMINISTIC 
BEGIN 
DECLARE i INT DEFAULT 0; 
DECLARE result VARCHAR(256); 
SET result=''; 
WHILE i < num DO 
SET i = i + 2; 
SET result = CONCAT(result, '  ', i); 
END WHILE; 
RETURN result; 
END // 
DELIMITER ; 

SELECT input_even(10);
