with sub as (
	select
		MAKEDATE(infectious_cases.year, 1) as first_of_year,
		CURDATE() as today
	from infectious_cases
)
select 
	*,
	TIMESTAMPDIFF(YEAR, first_of_year, today) as diff_in_years
from sub;