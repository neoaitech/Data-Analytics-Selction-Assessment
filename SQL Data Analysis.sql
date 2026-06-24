create database healthcare_dataset;

use healthcare_dataset;

-- change the name of the table 
alter table cleaned_healthcare_realistic_dataset
rename healthcare;
select * from healthcare;

-- Business Analysis
-- Which disease contributes the highest total treatment cost?
select Disease,sum(Treatment_Cost) as Treatment_cost
	from healthcare
    group by Disease
    order by Treatment_cost desc
    limit 1;
    
-- Which department generates the highest revenue?
select Department,sum(Treatment_Cost) as Revenue
	from healthcare
    group by Department
    order by Revenue desc
    limit 1;
    
-- What is the average treatment cost by disease and insurance status?
select Disease,Insurance_Status,round(avg(Treatment_Cost),2) as Avg_Treatment_cost
	from healthcare
    group by Disease,Insurance_Status;

-- What percentage of total treatment costs are covered by insured patients?
select 
	round(sum(case when Insurance_Status="Yes" then Treatment_cost else 0 
		end) * 100 / sum(Treatment_cost),2) as Insurance_Treatment_cost_percentage
	from healthcare;

-- Which city has the highest average treatment cost per patient?
select City,round(avg(Treatment_Cost),2) as Avg_Treatment_cost
	from healthcare
    group by City
    order by Avg_Treatment_cost desc
    limit 1;
    
-- Which age group (18–30, 31–45, 46–60, 60+) contributes the highest healthcare expenditure?
select 
	case when Age between 18 and 30 then "18-30"
		when Age between 31 and 45 then "31-45"
        when Age between 46 and 60 then "46-60"
	    else "60+"
	end as Age_Group,
        sum(Treatment_cost) as highest_healthcare_expenditure
	from healthcare
    group by Age_Group
    order by highest_healthcare_expenditure desc
    limit 1;
    
-- What diseases are most common among different age groups?
with Diseases as (
		select 
			case when Age between 18 and 30 then "18-30"
				when Age between 31 and 45 then "31-45"
				when Age between 46 and 60 then "46-60"
				else "60+"
			end as Age_Group, Disease,count(*) as Disease_Count,
			rank() over(partition by 
										case when Age between 18 and 30 then "18-30"
											when Age between 31 and 45 then "31-45"
											when Age between 46 and 60 then "46-60"
											else "60+"
										end order by count(*) desc) as rnk
			from healthcare 
            GROUP BY Age_Group, Disease
            )
	select Disease, Age_Group , Disease_Count
		from Diseases
        where rnk = 1;
        
-- Is there a significant difference in treatment costs between male and female patients?
select Gender,
		count(*) as Patients,
        sum(Treatment_Cost) as Treatment_Cost,
		round(avg(Treatment_Cost),2) as Avg_Treatment_cost
	from healthcare
    group by Gender;

-- Which blood group has the highest incidence of critical outcomes?
select Blood_Group, count(*) as Patients
	from healthcare
    where Outcome = "Critical"
    group by Blood_Group
    order by Patients desc
    limit 1;
