DROP FUNCTION IF EXISTS YearsDiff;

DELIMITER //
CREATE FUNCTION YearsDiff(year_from int)
RETURNS int
NO SQL
BEGIN
RETURN TIMESTAMPDIFF(YEAR, MAKEDATE(year_from, 1), CURDATE()) ;
END//
DELIMITER ;

select 
	year,
    YearsDiff(year)
from infectious_cases;