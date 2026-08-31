/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst postions.
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    average_salary DESC
LIMIT 20

/*
    SVN stands out dramatically at $400K — more than double the next skill. 
    That's likely driven by a very small number of niche legacy roles rather than broad demand. 
    The rest cluster between roughly $118K and $179K, with blockchain (Solidity), DevOps/infrastructure tools (Terraform, Ansible, Kafka), and ML frameworks (PyTorch, TensorFlow, Keras) well-represented in the top tiers.
*/