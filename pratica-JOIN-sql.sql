-- QUESTÃO 1 --
SELECT u.id, u.name, c.name as city FROM users u JOIN cities c ON c.id = u."cityId" WHERE c.name = 'Rio de Janeiro' ORDER BY u.id ASC;


-- QUESTÃO 2 --
SELECT t.id, u1.name as writer, u2.name as recipient, t.message FROM testimonials t JOIN users u1 ON t."writerId" = u1.id JOIN users u2 ON t."recipientId" = u2.id ORDER BY t.id ASC;

-- QUESTÃO 3 --
SELECT u.id, u.name, c.name, s.name, e."endDate" FROM users u JOIN educations e ON e."userId" = u.id JOIN courses c ON c.id = e."courseId" JOIN schools s ON s.id = e."schoolId" WHERE u.id = 30;

-- QUESTÃO 4 --
SELECT u.id, u.name, r.name as role, c.name as company, e."startDate" FROM companies c JOIN experiences e ON e."companyId" = c.id AND e."endDate" IS NULL JOIN users u ON u.id = e."u

-- QUESTÃO 5 --
SELECT s.id AS id, s.name AS school, c.name AS course, co.name AS company, r.name AS role
FROM educations e
JOIN schools s ON e."schoolId" = s.id
JOIN courses c ON e."courseId" = c.id
JOIN users u ON e."userId" = u.id
JOIN applicants a ON a."userId" = u.id
JOIN jobs j ON a."jobId" = j.id
JOIN companies co ON j."companyId" = co.id
JOIN roles r ON j."roleId" = r.id
WHERE co.id = 10
AND r.name = 'Software Engineer'
AND j.active = true;