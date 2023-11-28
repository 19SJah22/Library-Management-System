--List all students along with the courses they are enrolled in
SELECT s.*, c.course_name 
FROM Students s 
JOIN Enrollment e ON s.student_id = e.student_id 
JOIN Courses c ON e.course_id = c.course_id;
