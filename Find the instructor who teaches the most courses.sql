--Find the instructor who teaches the most courses
SELECT i.first_name, i.last_name, COUNT(c.course_id) AS num_courses_taught 
FROM Instructors i 
LEFT JOIN Courses c ON i.first_name = c.instructor 
GROUP BY i.first_name, i.last_name 
ORDER BY num_courses_taught DESC;


SELECT first_name, last_name, num_courses_taught
FROM (
    SELECT i.first_name, i.last_name, COUNT(c.course_id) AS num_courses_taught 
    FROM Instructors i 
    LEFT JOIN Courses c ON i.first_name = c.instructor 
    GROUP BY i.first_name, i.last_name 
    ORDER BY num_courses_taught DESC
)
WHERE ROWNUM = 1;
