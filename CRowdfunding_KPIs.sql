use crowd;

select * from projects;
select count(projectID) as No_of_Projects from projects;

-- Q.1.1 Convert the Date fields to Natural Time 
ALTER TABLE projects ADD COLUMN created_at_modified DATETIME;
UPDATE projects
SET created_at_modified = FROM_UNIXTIME(created_at);

ALTER TABLE projects ADD COLUMN deadline_modified DATETIME;
UPDATE projects
SET deadline_modified = FROM_UNIXTIME(deadline);

ALTER TABLE projects ADD COLUMN updated_at_modified DATETIME;
UPDATE projects
SET updated_at_modified = FROM_UNIXTIME(updated_at);

ALTER TABLE projects ADD COLUMN state_changed_at_modified DATETIME;
UPDATE projects
SET state_changed_at_modified = FROM_UNIXTIME(state_changed_at);

ALTER TABLE projects ADD COLUMN successful_at_modified DATETIME;
UPDATE projects
SET successful_at_modified = 
CASE 
WHEN successful_at = 0 THEN null -- or another default value
ELSE FROM_UNIXTIME(successful_at)
END;


ALTER TABLE projects ADD COLUMN launched_at_modified DATETIME;
UPDATE projects
SET launched_at_modified = FROM_UNIXTIME(launched_at);

-- Q.2  Build a Calendar Table using the Date Column Created Date. (created) 
-- Q.3  Build the Data Model using the attached Excel Files.(used joins)

-- Q.4  Convert the Goal amount into USD using the Static USD Rate.
ALTER TABLE projects ADD COLUMN Goal_Amount int;
UPDATE projects
SET Goal_Amount = Goal*static_usd_rate;

-- Q.5.1 Projects Overview KPI :   Total Number of Projects based on outcome    
select state as Outcome ,count(projectID) as No_of_Projects from projects group by state;

-- Q.5.2  Total Number of Projects based on Locations
select country as Location,count(projectid) from projects group by country;

-- Q.5.3 Total Number of Projects based on  Category
select c.name AS Category,
count(*) as No_of_projects
FROM category c LEFT JOIN projects p ON c.id = p.category_id
GROUP BY c.name
ORDER BY  No_of_projects desc;

-- Q.5.4  Total Number of Projects created by Year , Quarter , Month
select Year,Quarter,Month_name,No_of_Projects
from (SELECT YEAR(created_at_modified) AS Year, 
             MONTH(created_at_modified) AS Month,
             QUARTER(created_at_modified) AS quarter,
             MONTHname(created_at_modified) AS Month_Name, 
             COUNT(*) AS No_of_projects
FROM projects
GROUP BY year,month,Quarter,month_name
order by year, quarter,month) as P;

-- Q.6.1 Successful Projects based on Amount Raised
select state,concat(round(sum(goal_amount)/1000000),'M') as Amount_Raised from projects where state="successful";
-- Q.6.2 Successful Projects based on No of Backers
select state,concat(round(sum(backers_count)/1000000),'M') as No_of_Backers from projects where state="successful";
-- Q.6.3 Average no of days for Successful Projects 
SELECT 
round(AVG(DATEDIFF(successful_at_modified,created_at_modified)),2) AS Average_Days
FROM projects
WHERE state = 'successful';


-- Q.7.1  Top Successful Projects :Based on Number of Backers
select name,concat(round(Backers_count/1000),'K') as No_of_Backers from projects where state="successful" order by Backers_count desc limit 10;
-- Q.7.2  Top Successful Projects :Based on Amount Raised
select name,concat(round(goal_amount/1000000),'M') as Amount_Raised from projects where state="successful" order by goal_amount desc limit 10 ;

-- Q.8.1  Percentage of Successful Projects overall
SELECT 
    concat(round(COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100.0 / COUNT(*),2),"%") AS percentage_successful_projects
FROM 
    projects;
    
-- Q.8.2 Percentage of Successful Projects  by Category
SELECT 
c.name AS Category,
concat(round(COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100 / COUNT(*),2),"%") AS percentage_successful_projects
FROM category c LEFT JOIN projects p ON c.id = p.category_id
GROUP BY c.name
ORDER BY category;

-- Q.8.3 Percentage of Successful Projects by Year ,Quarter, Month 

select Year,Quarter,Month_name,percentage_successful_projects
from (SELECT YEAR(created_at_modified) AS Year, 
             MONTH(created_at_modified) AS Month,
		     QUARTER(created_at_modified) AS quarter,
             MONTHname(created_at_modified) AS Month_Name, 
             concat(round(COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100 / COUNT(*),2),"%") AS percentage_successful_projects
FROM projects
GROUP BY year,month,Quarter,month_name
order by year, quarter,month) as P;

-- Q.8.4   Percentage of Successful projects by Goal Range ( decide the range as per your need )
SELECT 
  CASE WHEN goal_amount < 1000 THEN 'Low'
    WHEN goal_amount >= 1000 AND goal_amount < 10000 THEN 'Medium'
    ELSE 'High'
    END AS goal_range,
  concat(round(COUNT(CASE WHEN state = 'successful' THEN 1 END) * 100 / COUNT(*),2),"%") AS percentage_successful_projects
FROM projects
GROUP BY goal_range
ORDER BY FIELD(goal_range, 'High', 'Medium', 'Low');
