CREATE TABLE `countries` (
  `Id` INT AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(40),
  `Code` varchar(15)
);

CREATE TABLE `infectious_cases` (
  `Id` INT AUTO_INCREMENT PRIMARY KEY,
  `CountryId` int,
  `Year` year DEFAULT NULL,
  `Number_yaws` int DEFAULT NULL,
  `polio_cases` int DEFAULT NULL,
  `cases_guinea_worm` int DEFAULT NULL,
  `Number_rabies` double DEFAULT NULL,
  `Number_malaria` double DEFAULT NULL,
  `Number_hiv` double DEFAULT NULL,
  `Number_tuberculosis` double DEFAULT NULL,
  `Number_smallpox` int DEFAULT NULL,
  `Number_cholera_cases` int DEFAULT NULL,
	FOREIGN KEY (CountryId) REFERENCES countries(id)
);

insert into countries(name, code) select distinct entity, code from infectious_cases_raw;
insert into infectious_cases(
	CountryId, 
    Year, 
    Number_yaws, 
    polio_cases, 
    cases_guinea_worm, 
    Number_rabies, 
    Number_malaria, 
    Number_hiv, 
    Number_tuberculosis, 
    Number_smallpox,
    Number_cholera_cases)
select 
	(select min(id) from countries where countries.name = raw.entity),
    raw.year,
    case when raw.Number_yaws = '' then null else raw.Number_yaws end, 
    case when raw.polio_cases = '' then null else raw.polio_cases end, 
    case when raw.cases_guinea_worm = '' then null else raw.cases_guinea_worm end, 
    case when raw.Number_rabies = '' then null else raw.Number_rabies end, 
    case when raw.Number_malaria = '' then null else raw.Number_malaria end, 
    case when raw.Number_hiv = '' then null else raw.Number_hiv end, 
    case when raw.Number_tuberculosis = '' then null else raw.Number_tuberculosis end, 
    case when raw.Number_smallpox = '' then null else raw.Number_smallpox end, 
    case when raw.Number_cholera_cases = '' then null else raw.Number_cholera_cases end
from infectious_cases_raw raw;
 
 select 
	(select count(1) from countries) as countries,
    (select count(1) from infectious_cases) as cases
from dual;
