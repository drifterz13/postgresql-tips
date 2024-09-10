/*
A Materialized View is a database object that stores the result of a query physically on disk. 
Unlike regular views, which are virtual and execute the query every time they are accessed, 
a materialized view is a snapshot of the data at a particular point in time, 
making access faster since the data is precomputed and stored.
*/

CREATE MATERIALIZED VIEW student_performance_summary AS
SELECT 
    s.student_id,
    s.student_name,
    COUNT(DISTINCT e.course_id) AS courses_enrolled,
    AVG(e.grade) AS avg_grade,
    COUNT(DISTINCT sub.assignment_id) AS assignments_submitted,
    AVG(sub.score) AS avg_assignment_score
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN submissions sub ON s.student_id = sub.student_id
GROUP BY s.student_id, s.student_name;

-- To refresh the materialized view:
REFRESH MATERIALIZED VIEW student_performance_summary;

-- Query using the materialized view:
SELECT *
FROM student_performance_summary
ORDER BY avg_grade DESC;
