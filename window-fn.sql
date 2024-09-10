/** 
Window functions perform calculations across a set of table rows related to 
the current row without collapsing the result set, unlike aggregate functions 
used with GROUP BY. These functions allow for computing aggregates, ranks, or 
running totals while still returning individual rows.
**/
SELECT 
    s.student_name,
    c.course_name,
    e.grade,
    AVG(e.grade) OVER (PARTITION BY s.student_id) AS student_avg_grade,
    AVG(e.grade) OVER (PARTITION BY c.course_id) AS course_avg_grade,
    RANK() OVER (PARTITION BY c.course_id ORDER BY e.grade DESC) AS course_rank,
    DENSE_RANK() OVER (ORDER BY e.grade DESC) AS overall_rank
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_name, c.course_name;

-- using group by
SELECT 
    s.student_name,
    AVG(e.grade) AS student_avg_grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_name;
