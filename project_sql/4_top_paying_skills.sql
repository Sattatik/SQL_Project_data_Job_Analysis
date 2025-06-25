/*
Answer: What are the top skills based on salary?
  • Look at the average salary associated with each skill for Data Analyst positions
  • Focuses on roles with specified salaries, regardless of location
    Why? It reveals how different skills impact salary levels for Data Analysts and helps identify
    the most financially rewarding skills to acquire or improve
*/



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

/*
Big Data and Cloud Lead: PySpark ($208,172) and Databricks ($141,906) top the list, reflecting strong demand for big data processing and cloud-based analytics skills.

AI/ML Integration: High salaries for DataRobot ($155,485) and Scikit-learn ($125,781) highlight the growing need for machine learning expertise in data analysis roles.

DevOps and Collaboration: Bitbucket ($189,154), GitLab ($154,500), and Notion ($125,000) show that version control and collaborative tools are increasingly valued, blending data analysis with software engineering practices.

-- Resulting output
[
  {
    "skills": "pyspark",
    "avg_salary": "208172.3"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "189154.5"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515.0"
  },
  {
    "skills": "watson",
    "avg_salary": "160515.0"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155485.5"
  },
  {
    "skills": "gitlab",
    "avg_salary": "154500.0"
  },
  {
    "skills": "swift",
    "avg_salary": "153750.0"
  },
  {
    "skills": "jupyter",
    "avg_salary": "152776.5"
  },
  {
    "skills": "pandas",
    "avg_salary": "151821.3"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "145000.0"
  },
  {
    "skills": "golang",
    "avg_salary": "145000.0"
  },
  {
    "skills": "numpy",
    "avg_salary": "143512.5"
  },
  {
    "skills": "databricks",
    "avg_salary": "141906.6"
  },
  {
    "skills": "linux",
    "avg_salary": "136507.5"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "132500.0"
  },
  {
    "skills": "atlassian",
    "avg_salary": "131161.8"
  },
  {
    "skills": "twilio",
    "avg_salary": "127000.0"
  },
  {
    "skills": "airflow",
    "avg_salary": "126103.0"
  },
  {
    "skills": "scikit-learn",
    "avg_salary": "125781.3"
  },
  {
    "skills": "jenkins",
    "avg_salary": "125436.3"
  },
  {
    "skills": "notion",
    "avg_salary": "125000.0"
  },
  {
    "skills": "scala",
    "avg_salary": "124903.0"
  },
  {
    "skills": "postgresql",
    "avg_salary": "123878.8"
  },
  {
    "skills": "gcp",
    "avg_salary": "122500.0"
  },
  {
    "skills": "microstrategy",
    "avg_salary": "121619.3"
  }
]
*/