WITH AverageGrades AS (
    SELECT course_id, AVG(grade) AS avg_grade
    FROM enrollments
    GROUP BY course_id
)
SELECT s.student_name, e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN AverageGrades ag ON e.course_id = ag.course_id
WHERE e.grade > ag.avg_grade
  AND e.course_id = 101; -- assuming 101 is the course ID

