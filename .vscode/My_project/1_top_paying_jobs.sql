/* What are the top paying Data Analyst jobs
   that are available remotely */

SELECT 
      job_id,
      job_title,
      company.name AS company_name,
      job_location,
      job_schedule_type,
      salary_year_avg,
      job_posted_date
FROM
      fact
LEFT JOIN company ON
      fact.company_id = company.company_id
WHERE 
      job_title_short = 'Data Analyst' AND
      salary_year_avg is NOT NULL AND
      job_location = 'Anywhere'
ORDER BY 
      salary_year_avg DESC
LIMIT 10;