--Find all instructors and the number of courses they teach
SELECT i.first_name, i.last_name, COUNT(c.course_id) AS num_courses_taught 
FROM Instructors i 
LEFT JOIN Courses c ON i.first_name = c.instructor 
GROUP BY i.first_name, i.last_name;
