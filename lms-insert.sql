-- Insert sample data
INSERT INTO students (student_name, email, enrollment_date) VALUES ('Alice Johnson', 'alice@example.com', '2023-09-01'),
('Bob Smith', 'bob@example.com', '2023-09-01'),
('Charlie Brown', 'charlie@example.com', '2023-09-01'),
('Diana Ross', 'diana@example.com', '2023-09-01'),
('Ethan Hunt', 'ethan@example.com', '2023-09-01');

INSERT INTO courses (course_name, instructor, credits) VALUES
('Introduction to SQL', 'Prof. Anderson', 3),
('Data Structures', 'Dr. Lee', 4),
('Web Development', 'Ms. Martinez', 3),
('Machine Learning', 'Dr. Patel', 4),
('Computer Networks', 'Prof. Wilson', 3);

INSERT INTO enrollments (student_id, course_id, enrollment_date, grade) VALUES
(1, 1, '2023-09-05', 3.7),
(1, 2, '2023-09-05', 3.3),
(2, 1, '2023-09-06', 3.5),
(2, 3, '2023-09-06', 4.0),
(3, 2, '2023-09-07', 3.8),
(3, 4, '2023-09-07', 3.6),
(4, 3, '2023-09-08', 3.9),
(4, 5, '2023-09-08', 3.7),
(5, 4, '2023-09-09', 3.5),
(5, 5, '2023-09-09', 3.8);

INSERT INTO assignments (course_id, assignment_name, due_date) VALUES
(1, 'SQL Basics Quiz', '2023-10-15'),
(1, 'Database Design Project', '2023-11-30'),
(2, 'Binary Tree Implementation', '2023-10-20'),
(2, 'Sorting Algorithms Comparison', '2023-12-05'),
(3, 'HTML/CSS Portfolio', '2023-10-25'),
(3, 'JavaScript Game Project', '2023-12-10'),
(4, 'Linear Regression Analysis', '2023-11-05'),
(4, 'Neural Network Implementation', '2023-12-15'),
(5, 'Network Protocol Simulation', '2023-11-10'),
(5, 'Cybersecurity Case Study', '2023-12-20');

INSERT INTO submissions (assignment_id, student_id, submission_date, score) VALUES
(1, 1, '2023-10-14', 90),
(1, 2, '2023-10-15', 85),
(2, 1, '2023-11-29', 88),
(2, 2, '2023-11-30', 92),
(3, 1, '2023-10-19', 78),
(3, 3, '2023-10-20', 95),
(4, 1, '2023-12-04', 82),
(4, 3, '2023-12-05', 89),
(5, 2, '2023-10-24', 91),
(5, 4, '2023-10-25', 87);
