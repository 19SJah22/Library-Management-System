-- Create a trigger that automatically updates a student's GPA
ALTER TABLE Students
ADD gpa NUMBER;
 
CREATE OR REPLACE TRIGGER update_gpa_trigger
AFTER INSERT ON Enrollment
FOR EACH ROW
DECLARE
    total_credits NUMBER;
    total_points NUMBER;
    new_gpa NUMBER;
BEGIN
    SELECT SUM(credits), SUM(credits * CASE
                                         WHEN grade >= 90 THEN 4.0
                                         WHEN grade >= 80 THEN 3.0
                                         WHEN grade >= 70 THEN 2.0
                                         WHEN grade >= 60 THEN 1.0
                                         ELSE 0.0
                                     END)
    INTO total_credits, total_points
    FROM Enrollment
    JOIN Courses ON Enrollment.course_id = Courses.course_id
    WHERE student_id = :NEW.student_id;
 
    IF total_credits > 0 THEN
        new_gpa := total_points / total_credits;
    ELSE
        new_gpa := 0;
    END IF;
 
    UPDATE Students
    SET gpa = new_gpa
    WHERE student_id = :NEW.student_id;
END;
