# Introduction
Dive into the data job market! This project focuses on data analyst roles, exploring top-paying jobs, in-demand skills, and where high demand meets high salaries in data analytics.

🔎 🗂️ View the SQL queries here: [project_sql folder](/project_sql/).

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project aims to identify top-paying and in-demand skills, helping others streamline their search for optimal jobs.The data comes from my [SQL Course](https://lukebarousse.com/sql), packed with insights on job titles, salaries, locations, and essential skills.


### Aim of this SQL quiries were:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3.What skills are most in demand for data analysts?
4. hich skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I used the following key tools:
- **SQL:** The backbone of my analysis, enabling me to query the database and uncover critical insights.
- **PostgreSQL:** My chosen database management system, ideal for handling job posting data.
- **Visual Studio Code:** My preferred environment for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control, sharing SQL scripts, and tracking project progress.

# The Analysis
Each query in this project investigated specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst postings by average yearly salary and location, focusing primarily on remote positions.

```SQL
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.job_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND 
    job_location = 'Anywhere'  AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC      
LIMIT 20;      

```
### 2. Skills Required For The Top-Payin Jobs
To understand the skills required for top-paying jobs, I joined job postings with skills data to gain insight into employer requirements for high-compensation positions.


```SQL
-- Start of a CTE
WITH top_paying_job AS 
    (SELECT
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.job_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere'  AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC      
    LIMIT 20 )      
-- END of a CTE
SELECT
    top_paying_job.*,
    skills
FROM top_paying_job
    INNER JOIN skills_job_dim
     ON top_paying_job.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
     ON  skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
       salary_year_avg DESC;    
```

### 3. The Most In-Demand Skills For Data Analysts
This query identified the most requested skills in data analyst job postings.


```SQL
-- First verion with CTE
-- Start of a CTE
WITH remote_job_skills AS
    (
        SELECT
        skill_id,
        COUNT (*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
    WHERE
        job_postings.job_work_from_home = True AND
        job_postings.job_title_short = 'Data Analyst'
    GROUP BY
        skill_id
    )
-- End of a CTE
SELECT
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;    

    -- Main version 
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
    ON  skills_job_dim.skill_id = skills_dim.skill_id    
WHERE job_title_short = 'Data Analyst' AND 
        job_work_from_home = True
GROUP BY 
    skills 
ORDER BY demand_count DESC    
LIMIT 5;
```
- SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet management.
- Programming and visualization tools like Python, Tableau, and Power BI are essential, highlighting the growing importance of technical skills in data storytelling and decision support.



|Skills   |Demand Count|
|---------|-----------|
| SQL     | 7291      |
| Excel   | 4611      |
| Python  | 4330      |
| Tableau | 3745      |
| Power BI| 2609      |
*Table: Demand for the top 5 skills in data analyst job postings*


### 4. Skills Based On Salary
This query examined the average salaries associated with different skills.

```SQL
SELECT 
    skills,
   ROUND(AVG(salary_year_avg), 1) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
    ON  skills_job_dim.skill_id = skills_dim.skill_id    
WHERE job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE
GROUP BY 
    skills 
ORDER BY avg_salary DESC    
LIMIT 25;
```
### 5. What Are The Top-paying Jobs For My Role
This query combined insights from demand and salary data to identify skills that are both high in demand and associated with high salaries.

```SQL
ITH skills_demand AS
    (
  SELECT
      skills_dim.skill_id,
      skills_dim.skills,
      COUNT(skills_job_dim.job_id) AS demand_count
  FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
  WHERE
      job_title_short = 'Data Analyst'
      AND salary_year_avg IS NOT NULL
      AND job_work_from_home = True
  GROUP BY
      skills_dim.skill_id
    ),average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND (AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
    )

SELECT
  --skills_demand.skill_id,
    skills_demand.skills AS skill,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id  = average_salary.skill_id
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 20;
```
breakdown of the top data analyst jobs (2023:
- Wide Salary Range: The top 10 data analyst roles offer salaries ranging from $184,000 to $650,000, indicating significant earning potential.
- Diverse Employers: Companies like SmartAsset, Meta, and AT&T offer high salaries, reflecting broad interest across industries.
- Job Title Variety: Job titles range from Data Analyst to Director of Analytics, showcasing diverse roles and specializations within data analytics.


# What I Learned 
Through this project, I’ve enhanced my SQL skills significantly:
- **Complex Query Crafting:** Mastered advanced SQL techniques, including table joins and using WITH clauses for efficient temporary table operations.
- **Data Aggregation:** Became proficient with GROUP BY and aggregate functions like COUNT() and AVG() for summarizing data.
- **Analytical Skills:** Improved my ability to solve real-world problems by translating questions into actionable, insightful SQL queries.


