select 
	countries.name as country,
    avg(Number_rabies) as average,
    min(Number_rabies) as min,
    max(Number_rabies) as max,
    sum(Number_rabies) as sum
from infectious_cases join countries on CountryId = countries.id
where Number_rabies is not null
group by countries.id
order by average desc
limit 10;