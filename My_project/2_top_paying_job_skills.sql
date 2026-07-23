--Top paying jobs skill

WITH cte AS
(
    SELECT 
        job_id,
        job_title,
        company.name AS company_name,
        job_location,
        job_schedule_type,
        salary_year_avg,
        job_posted_date
    FROM fact
    LEFT JOIN company
        ON fact.company_id = company.company_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    cte.*,
    skills.name AS skill
FROM cte
inner JOIN skillsjob
    ON cte.job_id = skillsjob.job_id
inner JOIN skills
    ON skillsjob.skill_id = skills.skill_id
WHERE
     skills.name is not NULL
ORDER BY cte.salary_year_avg DESC;
      

/*
Skill Frequency Insights

Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:

- SQL is leading with a bold count of 8.
- Python follows closely with a bold count of 7.
- Tableau is also highly sought after, with a bold count of 6.
- Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
*/
