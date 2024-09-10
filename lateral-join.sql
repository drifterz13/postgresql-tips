/*
A LATERAL JOIN in SQL allows a subquery to reference columns from the preceding tables 
in the FROM clause. It acts like a correlated subquery but enables more complex 
interactions between tables.
*/

-- 1. Get the Latest Course Enrollment for Each Student
SELECT s.student_name, latest.course_name, latest.enrollment_date
FROM students s
JOIN LATERAL (
    SELECT c.course_name, e.enrollment_date
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    WHERE e.student_id = s.student_id
    ORDER BY e.enrollment_date DESC
    LIMIT 1
) AS latest ON true;

-- Using join
SELECT s.student_name, c.course_name, e.enrollment_date
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN (
    -- Subquery to get the latest enrollment date for each student
    SELECT student_id, MAX(enrollment_date) AS latest_enrollment_date
    FROM enrollments
    GROUP BY student_id
) AS latest 
ON e.student_id = latest.student_id AND e.enrollment_date = latest.latest_enrollment_date
ORDER BY s.student_name;


-- 2. Get the Top 3 Highest Grades for Each Student Across All Courses
SELECT s.student_name, top_grades.course_name, top_grades.grade
FROM students s
JOIN LATERAL (
    SELECT c.course_name, e.grade
    FROM enrollments e
    JOIN courses c ON e.course_id = c.course_id
    WHERE e.student_id = s.student_id
    ORDER BY e.grade DESC
    LIMIT 3
) AS top_grades ON true;

-- 3. List Courses with the Highest Scorer in Each Course
SELECT c.course_name, top_student.student_name, top_student.grade
FROM courses c
JOIN LATERAL (
    SELECT s.student_name, e.grade
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    WHERE e.course_id = c.course_id
    ORDER BY e.grade DESC
    LIMIT 1
) AS top_student ON true;

