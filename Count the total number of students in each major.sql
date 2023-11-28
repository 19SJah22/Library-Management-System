--Count the total number of students in each major
SELECT major, COUNT(*) AS total_students 
FROM Students 
GROUP BY major;
