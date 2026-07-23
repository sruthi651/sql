/* 
Answer : What are the most optimal skills tolearn(aka its in high demand and high paying skill)?
--Why? Trgets skills that offer job security and financial benefits offering
strategic insights for career development in data analysis 
*/


SELECT 
       skillsjob.skill_id,
       skills.name as skill_name,
       round(avg(fact.salary_year_avg),2)as top_skills,
       count(skills.skill_id) as skill_frequency
FROM fact
LEFT JOIN skillsjob
    ON fact.job_id = skillsjob.job_id
LEFT JOIN skills
    ON skillsjob.skill_id = skills.skill_id
WHERE
       job_title_short = 'Data Analyst' AND
       skills.name is NOT NULL AND
       fact.salary_year_avg is NOT NULL 
GROUP BY
       skill_name,
       skills.skill_id
ORDER BY
       skill_frequency DESC,
       top_skills DESC
limit 25;

