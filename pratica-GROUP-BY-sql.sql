-- QUESTÂO 1 --
SELECT COUNT(id) AS "currentExperiences" FROM experiences WHERE "endDate" IS NOT NULL;
-- OU
SELECT COUNT(id) AS "currentExperiences" FROM experiences GROUP BY "endDate" IS NOT NULL ORDER BY "currentExperiences" DESC LIMIT 1;

-- QUESTÂO 2 --
SELECT "userId" AS id, COUNT("courseId") AS educations FROM educations GROUP BY "userId";

-- QUESTÂO 3 --
SELECT users.name AS writer, COUNT(testimonials.id) AS "testimonialCount" FROM testimonials JOIN users ON users.id = testimonials."writerId" WHERE testimonials."writerId" = 435 GROUP BY writer;

-- QUESTÂO 4 --
SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS role FROM jobs JOIN roles ON roles.id = jobs."roleId" AND jobs.active = true GROUP BY roles.name, jobs.active  ORDER BY "maximumSalary" ASC;

-- QUESTÂO BÔNUS --
SELECT s.name AS school, c.name AS course, COUNT(e.id) AS "studentCount", e.status
FROM educations e
JOIN schools s ON s.id = e."schoolId"
JOIN courses c ON c.id = e."courseId"
WHERE e.status = 'finished' OR e.status = 'ongoing'
GROUP BY c.id,s.id,e.status
ORDER BY "studentCount" DESC
LIMIT 3;