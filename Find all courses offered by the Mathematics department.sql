--Find all courses offered by the 'Mathematics' department
SELECT course_id, course_name, instructor, credits
FROM Courses
WHERE instructor IN (SELECT first_name
                    FROM Instructors
                    WHERE department = 'Mathematics');
