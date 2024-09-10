/*
A Common Table Expression (CTE) is a temporary result set in SQL, defined within a query, 
that can be referenced multiple times. CTEs are created using the WITH keyword and 
are useful for simplifying complex queries, improving readability, and organizing subqueries.
*/
WITH course_averages AS (
    SELECT 
        c.course_id,
        c.course_name,
        AVG(e.grade) AS avg_grade
    FROM courses c
    JOIN enrollments e ON c.course_id = e.course_id
    GROUP BY c.course_id, c.course_name
)
SELECT 
    s.student_name,
    c.course_name,
    e.grade,
    ca.avg_grade,
    e.grade - ca.avg_grade AS grade_difference
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN course_averages ca ON c.course_id = ca.course_id
ORDER BY c.course_name, s.student_name;


WITH ranked_students AS (
    SELECT 
        c.course_name,
        s.student_name,
        e.grade,
        ROW_NUMBER() OVER (PARTITION BY c.course_id ORDER BY e.grade DESC) AS rank
    FROM courses c
    JOIN enrollments e ON c.course_id = e.course_id
    JOIN students s ON e.student_id = s.student_id
)
SELECT course_name, student_name, grade
FROM ranked_students
WHERE rank <= 2
ORDER BY course_name, grade DESC;
