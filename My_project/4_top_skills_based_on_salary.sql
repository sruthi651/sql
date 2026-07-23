SELECT 
       skills.name as skill_name,
       round(avg(fact.salary_year_avg),2)as top_skills
FROM fact
LEFT JOIN skillsjob
    ON fact.job_id = skillsjob.job_id
LEFT JOIN skills
    ON skillsjob.skill_id = skills.skill_id
WHERE
       job_title_short = 'Data Analyst'
GROUP BY
       skill_name
ORDER BY
       top_skills DESC
limit 25;