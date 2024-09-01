--------------------#1 CREATE COOKIE_CATS TABLE------------------------------------------------------------------------


CREATE table cookie_cats
(
userid int primary key
,version varchar
,sum_gamerounds int
,retention_1 boolean
,retention_7 boolean
)

	
COPY cookie_cats 
FROM 'E:\Qua Na Lab\2. A-REA\Qua Na Data Analyst Career\1. (P)ROJECT\#3 AB testing - Cookie Cats\1. Dataset\Cookie Cats Mobile Game\cookie_cats.csv'
DELIMITER ','
CSV HEADER




--------------------#2 DATA CLEANING------------------------------------------------------------------------


--Detect duplicate
	
SELECT userid, count(*) 
FROM cookie_cats
GROUP BY 1
HAVING count(*) > 1


--Detect non-standard value

SELECT version, count(*)
FROM cookie_cats
GROUP BY 1

	
SELECT retention_1, count(*)
FROM cookie_cats
GROUP BY 1

	
SELECT retention_7, count(*)
FROM cookie_cats
GROUP BY 1


--Detect missing value

SELECT *
FROM cookie_cats
WHERE sum_gamerounds is null


--Detect outlier >> one anomaly has sum_gamerounds = 49854 

SELECT sum_gamerounds, count(*)
FROM cookie_cats
GROUP BY 1
ORDER BY 1 desc


--Remove anomaly
	
SELECT *
FROM cookie_cats
WHERE sum_gamerounds <> 49854




--------------------#3 COMPUTE METRICS------------------------------------------------------------------------


--Compute 1 Day Retention & 7 Day Retention

SELECT version
,count(userid) as total_players
,count (case when retention_1 = true then userid end) as retention_1_day
,count (case when retention_1 = true then userid end)*1.0/count(userid) as pct_retention_1_day
,count (case when retention_7 = true then userid end) as retention_7_day
,count (case when retention_7 = true then userid end)*1.0/count(userid) as pct_retention_7_day
FROM cookie_cats 
WHERE sum_gamerounds <> 49854
GROUP BY 1


--Compute gameround survivorship table

SELECT a.version
,b.round
,count(userid) as cohort
,count(case when a.sum_gamerounds >= b.round then userid end) as cohort_survived
,count(case when a.sum_gamerounds >= b.round then userid end) *1.0/count(userid) as pct_cohort_survived
FROM cookie_cats a
JOIN
(
	SELECT generate_series as round
	FROM generate_series(0,150,1)
) b on 1=1
WHERE a.sum_gamerounds <> 49854
GROUP BY 1,2
ORDER BY 2 


