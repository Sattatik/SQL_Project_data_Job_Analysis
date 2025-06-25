
/*
Question: 
    - What skills are required for the top-paying data analyst jobs?
    - Use the top 10 highest-paying Data Analyst jobs from first query
    - Add the specific skills required for these roles
    - Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/


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

/*
Core Skills for Top-Paying Data Analyst Jobs:
SQL and Python are nearly ubiquitous, appearing in 867% and 80% of jobs, respectively, and are critical for roles with salaries above $200,000.

Tableau is the most common visualization tool, required in 66.7% of jobs, especially in high-paying positions like "Associate Director- Data Insights" and "Data Analyst, Marketing."

High-Value Skill Combinations:
The trio of sql, python, and tableau is a hallmark of top-paying roles, appearing in 60% of jobs.

Cloud platforms (aws, azure, snowflake) and data processing tools (pandas, pyspark, databricks) are associated with the highest salary ($255,829.50), indicating demand for cloud-based data analytics expertise.

[
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "salary_year_avg": "255829.5",
    "company_name": null,
    "skills": "powerpoint"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": null,
    "skills": "hadoop"
  },
  {
    "job_id": 99305,
    "job_title": "Data Analyst, Marketing",
    "salary_year_avg": "232423.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": null,
    "skills": "crystal"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": null,
    "skills": "oracle"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 1021647,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "salary_year_avg": "217000.0",
    "company_name": null,
    "skills": "flow"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "sql"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "python"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "go"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "snowflake"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "pandas"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "numpy"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "excel"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "tableau"
  },
  {
    "job_id": 168310,
    "job_title": "Principal Data Analyst (Remote)",
    "salary_year_avg": "205000.0",
    "company_name": "Newforce Global Services USA Inc.",
    "skills": "gitlab"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "azure"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "aws"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "oracle"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "snowflake"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "power bi"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "sap"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "jenkins"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "bitbucket"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "atlassian"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "jira"
  },
  {
    "job_id": 731368,
    "job_title": "Director, Data Analyst - HYBRID",
    "salary_year_avg": "189309.0",
    "company_name": null,
    "skills": "confluence"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "git"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "bitbucket"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "atlassian"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "jira"
  },
  {
    "job_id": 310660,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "salary_year_avg": "189000.0",
    "company_name": null,
    "skills": "confluence"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "go"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "snowflake"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "pandas"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "numpy"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "excel"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 1749593,
    "job_title": "Principal Data Analyst",
    "salary_year_avg": "186000.0",
    "company_name": null,
    "skills": "gitlab"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 387860,
    "job_title": "ERM Data Analyst",
    "salary_year_avg": "184000.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 1352513,
    "job_title": "REMOTE Director of Data Analytics",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "azure"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "java"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "go"
  },
  {
    "job_id": 1781684,
    "job_title": "DTCC Data Analyst",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "excel"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "azure"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "databricks"
  },
  {
    "job_id": 987523,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "salary_year_avg": "170000.0",
    "company_name": null,
    "skills": "power bi"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "swift"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "excel"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 1525451,
    "job_title": "Manager, Data Analyst",
    "salary_year_avg": "167000.0",
    "company_name": null,
    "skills": "looker"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "mysql"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "aws"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "sas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "matlab"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "pandas"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "looker"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "company_name": null,
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": null,
    "skills": "sas"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": null,
    "skills": "go"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": null,
    "skills": "crystal"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 618890,
    "job_title": "Principal Data Intelligence Analyst - Cardiac - Remote",
    "salary_year_avg": "163500.0",
    "company_name": null,
    "skills": "sas"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "sql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "python"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "scala"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "r"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "mysql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "postgresql"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "couchbase"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "azure"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "databricks"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "aws"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "redshift"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "oracle"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "snowflake"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "watson"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "pyspark"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "airflow"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "linux"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "tableau"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "ssis"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "cognos"
  },
  {
    "job_id": 918213,
    "job_title": "Senior - Data Analyst",
    "salary_year_avg": "160515.0",
    "company_name": null,
    "skills": "visio"
  }
]

*/
