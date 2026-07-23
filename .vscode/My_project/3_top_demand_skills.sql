
/*-- What are the most in demand skills for data analyst ?
  --Why? Retrieves the top 5 skills with the highest demand in the job maket,
       providing insights into the most valuable skills for job seekers*/

SELECT 
       skills.name as skill_name,
       count(skills.skill_id) as count_of_skills
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
       count_of_skills DESC
limit 10;
