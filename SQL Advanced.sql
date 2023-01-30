-- Convert to string(varchar)
select cast(funding_total_usd as varchar), cast(founded_at_clean as varchar)
from tutorial.crunchbase_companies_clean_date

-- date format time to acquisition
select comp.permalink, comp.founded_at_clean, acqu.acquired_at_cleaned, 
acqu.acquired_at_cleaned - comp.founded_at_clean :: timestamp as time_to_acquisition
from tutorial.crunchbase_companies_clean_date comp
join tutorial.crunchbase_acquisitions_clean_date acqu 
on acqu.company_permalink = comp.permalink 
where founded_at_clean is not null 

-- Count date format
select c.category_code, 
      count(case when a.acquired_at_cleaned <= c.founded_at_clean::timestamp + interval '3years'then category_code else null end),
      count(category_code) as total
from tutorial.crunchbase_companies_clean_date c 
join tutorial.crunchbase_acquisitions_clean_date a 
on a.company_permalink = c.permalink 
where c.founded_at is not null 
group by category_code
order by total DESC

-- Left function
select incidnt_num, date, LEFT(date, 10) as cleaned_date
from tutorial.sf_crime_incidents_2014_01

-- Right function 
select incidnt_num, date, LEFT(date, 10) as cleaned_date, right(date, 17) as cleaned_time
from tutorial.sf_crime_incidents_2014_01

-- Trim
select location, trim(both '()' from location) 
from tutorial.sf_crime_incidents_2014_01

-- position CASE SENSITIVE
select incidnt_num, descript, position('A' in descript) as a_position
from tutorial.sf_crime_incidents_2014_01

-- strpos(string position?) CASE SENSITIVE
select incidnt_num, descript, strpos('A', descript) as a_position
from tutorial.sf_crime_incidents_2014_01

-- trim
select location, 
trim(leading '(' from left(location, position(','in location)-1)) as lat,
trim(trailing ')' from right(location, position(',' in location))) as long
from tutorial.sf_crime_incidents_2014_01

-- Concatenate
select location, lat, lon, concat('(', lat,', ', lon,')')
from tutorial.sf_crime_incidents_2014_01

-- concat alt
select location, '(' || lat||', '|| lon|| ')' as concat
from tutorial.sf_crime_incidents_2014_01

-- concat date
select date, Concat(substr(date, 7, 4), '/', substr(date, 4, 2), '/', substr(date, 1, 2)) as clean_date
from tutorial.sf_crime_incidents_2014_01
