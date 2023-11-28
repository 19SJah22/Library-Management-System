--Display all students enrolled in 'Database Systems' course
SELECT Students.*
FROM Students
JOIN Enrollment ON Students.student_id = Enrollment.student_id
JOIN Courses ON Enrollment.course_id = Courses.course_id
WHERE Courses.course_name = 'Database Systems';
