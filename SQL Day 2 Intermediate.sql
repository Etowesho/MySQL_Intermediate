SELECT COUNT(*)
FROM tutorial.aapl_historical_stock_price
	--
SELECT COUNT(high)
FROM tutorial.aapl_historical_stock_price
	--
SELECT COUNT(low) as "Low Count"
FROM tutorial.aapl_historical_stock_price
	--
SELECT count(date) as "Date", count(year) as "Year", count(month) as "Month", count(open) as "Open", count(high) as "High", count(low) as "Low", count(close) as "Close", count(volume) as "Volume", count(id) as "ID"
FROM tutorial.aapl_historical_stock_price
	--
select sum(volume)
FROM tutorial.aapl_historical_stock_price
	--
select sum(open) / count(open) "Avg"
FROM tutorial.aapl_historical_stock_price
	--
select min(volume) as min_volume, max(volume) as max_volume
FROM tutorial.aapl_historical_stock_price
	--
select min(low) as min_stock
FROM tutorial.aapl_historical_stock_price
	--
select distinct month 
from tutorial.aapl_historical_stock_price
	--
select distinct month, year 
from tutorial.aapl_historical_stock_price
	--
select distinct year
from tutorial.aapl_historical_stock_price
order by year ASC
	--
select max(close)
FROM tutorial.aapl_historical_stock_price
	--
select avg(volume)
FROM tutorial.aapl_historical_stock_price
	--
select month, sum(volume) as vol
FROM tutorial.aapl_historical_stock_price
group by month
order by month ASC
	--
select year, avg(open - close)
from tutorial.aapl_historical_stock_price
group by year
order by year asc
	--
select month, min(low), max(high)
from tutorial.aapl_historical_stock_price
group by month
order by month asc
	--
select year, month, max(high) as month_high
from tutorial.aapl_historical_stock_price
group by year, month
having max(high)>400
order by year, month
	--
select player_name, year, CASE WHEN year = 'SR' THEN 'yes'
ELSE 'no' END AS is_a_senior
FROM benn.college_football_players
	--
select player_name, state, CASE WHEN state = 'CA' THEN 'yes'
ELSE 'no' END AS "California?"
FROM benn.college_football_players
	--
SELECT player_name,
       height,
       CASE WHEN height > 80 THEN 'over 80'
            WHEN height > 70 AND height <= 80 THEN '70-80'
            WHEN height > 60 AND height <= 70 THEN '60-70'
            ELSE 'under 60' END AS height_group
  FROM benn.college_football_players
	--
SELECT full_school_name, school_name, player_name, position, height, weight, year, hometown, state, id, 
case WHEN year = 'SR' OR year = 'JR' THEN player_name
else null
END AS ply_nm
FROM benn.college_football_players
	--
SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(*) AS count
  FROM benn.college_football_players
 GROUP BY year_group
	--
select count(distinct month) as unique_month
from tutorial.aapl_historical_stock_price
	--
select year, count(distinct month) as unique_month
from tutorial.aapl_historical_stock_price
group by year
order by year asc
	--
select count(distinct month) as unique_month, count (distinct year) as unique_year
from tutorial.aapl_historical_stock_price
	--
select * from benn.college_football_players p 
join benn.college_football_teams t 
on t.school_name = p.school_name 
	--
select p.*, t.* 
from benn.college_football_players p 
join benn.college_football_teams t 
on t.school_name = p.school_name 
	--
select p.player_name, p.school_name, t.conference 
from benn.college_football_players p 
join benn.college_football_teams t 
on t.school_name = p.school_name 
where division = 'FBS (Division I-A Teams)'
	--
select * from tutorial.crunchbase_companies comp
left join tutorial.crunchbase_acquisitions acq
on comp.permalink = acq.company_permalink 
	--
select count(comp.permalink) as comp_permalink ,count(acq.company_permalink) as acq_permalink
from tutorial.crunchbase_companies comp
left join tutorial.crunchbase_acquisitions acq
on comp.permalink = acq.company_permalink  
	--
select count(comp.permalink) as comp_permalink ,count(acq.company_permalink) as acq_permalink
from tutorial.crunchbase_companies comp
inner join tutorial.crunchbase_acquisitions acq
on comp.permalink = acq.company_permalink 
	--
select count(distinct comp.permalink) as comp_permalink ,count(distinct acq.company_permalink) as acq_permalink
from tutorial.crunchbase_companies comp
inner join tutorial.crunchbase_acquisitions acq
on comp.permalink = acq.company_permalink 
	--
select count(distinct comp.permalink) as comp_permalink ,count(distinct acq.company_permalink) as acq_permalink
from tutorial.crunchbase_companies comp
right join tutorial.crunchbase_acquisitions acq
on comp.permalink = acq.company_permalink 
