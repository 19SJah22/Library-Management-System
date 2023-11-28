--This view will display the average grade for each course
CREATE OR REPLACE VIEW AverageGradePerCourse AS
SELECT course_id, AVG(grade) AS average_grade
FROM Enrollment
GROUP BY course_id;
