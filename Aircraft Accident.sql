--- EVENT ANALYSIS

-- top 10 aircraft make with most accidents
select top 10 acft_make "Aircraft make", count(*) accidents
from aircraft
join events
on aircraft.ev_id = events.ev_id
group by acft_make
order by 2 desc

-- top 10 countries with most accidents
select top 10 country_name Country, count(*) accidents
from country
join events
on country.country_code = events.ev_country
group by country_name
order by 2 DESC

-- accident count by light condition
select light_cond "Light condition", count(*) accidents
from events
group by light_cond
order by 2 desc

-- accident count by sky condition
select sky_cond_nonceil "Sky condition", count(*) accidents
from events
group by sky_cond_nonceil
order by 2 desc

-- accident by aircraft category
select acft_category "Aircraft category", count(*) accidents
from aircraft
join events
on aircraft.ev_id = events.ev_id
group by acft_category

-- fire occurence
select acft_fire "Aircraft position", count(*) Fire_events
from aircraft
group by acft_fire
order by 2 desc

-- explosion occurence
select acft_expl "Aircraft position", count(*) Explosion_events
from aircraft
group by acft_expl
order by 2 desc

-- aircraft accident by year
select DATEPART(year, ev_date) "Year", count(*) incidents
from events
group by DATEPART(year, ev_date)


---DESTINATION ANALYSIS

-- top destination country
select top 10 COUNTRY_NAME Country, count(*) accidents
from aircraft
join events
on aircraft.ev_id = events.ev_id
join country
on events.ev_country = country.COUNTRY_CODE
group by COUNTRY_NAME
order by 2 desc

-- destination country & city
select COUNTRY_NAME Country, dest_city Destination_city, count(*) accidents
from aircraft
join events
on aircraft.ev_id = events.ev_id
join country
on events.ev_country = country.COUNTRY_CODE
group by COUNTRY_NAME, dest_city
order by 3 DESC


--- INJURY ANALYSIS

-- injury event count
select count(*) "Injury event count"
from injury
join events
on injury.ev_id = events.ev_id 

-- injured person count
select SUM(inj_person_count) "Injured person count"
from injury

-- injury events by injury level
select injury_level "Injury level", count(*) accident
from injury
group by injury_level
order by 2 desc

-- injury events by injured person category
select inj_person_category "Injured person category", count(*) no_of_events
from injury
join events
on injury.ev_id = events.ev_id
group by inj_person_category

-- top 10 aircraft make with most injury events
select top 10 acft_make "Aircraft make", count(injury.ev_id) injury_events
from aircraft
join injury
on aircraft.ev_id = injury.ev_id
group by acft_make
having count(injury.ev_id) > 40
order by 2 desc

-- injury events by top 10 event country
select top 10 COUNTRY_NAME Country, count(*) injury_events
from injury
join events
on injury.ev_id = events.ev_id
join country
on events.ev_country = country.COUNTRY_CODE
group by COUNTRY_NAME
order by 2 desc






