--Write a stored procedure to enroll a student in a course 

CREATE OR REPLACE PROCEDURE enroll_student_in_course(
    p_student_id IN INT,
    p_course_id IN INT
)
IS
    v_course_limit INT;
    v_enrollment_count INT;
BEGIN
    SELECT COUNT(*)
    INTO v_enrollment_count
    FROM Enrollment
    WHERE student_id = p_student_id AND course_id = p_course_id;
 
    IF v_enrollment_count = 0 THEN
        SELECT credits
        INTO v_course_limit
        FROM Courses
        WHERE course_id = p_course_id;
 
        SELECT COUNT(*)
        INTO v_enrollment_count
        FROM Enrollment
        WHERE course_id = p_course_id;
 
        IF v_enrollment_count < v_course_limit THEN
            INSERT INTO Enrollment (student_id, course_id)
            VALUES (p_student_id, p_course_id);
            DBMS_OUTPUT.PUT_LINE('Enrollment successful.');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Course is full. Enrollment failed.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student is already enrolled in the course.');
    END IF;
END;
