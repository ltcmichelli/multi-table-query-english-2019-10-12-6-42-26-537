# 1.Query the existence of 1 course
SELECT * FROM COURSE WHERE ID = 1;
# 2.Query the presence of both 1 and 2 courses
SELECT * FROM COURSE WHERE ID = 1 or ID=2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT STUDENT.ID, STUDENT.NAME, AVG(STUDENT_COURSE.SCORE) FROM STUDENT, STUDENT_COURSE GROUP BY STUDENT.NAME, STUDENT_COURSE.STUDENTID HAVING AVG(STUDENT_COURSE.SCORE) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM STUDENT WHERE NOT EXISTS (SELECT DISTINCT STUDENTID FROM STUDENT_COURSE WHERE STUDENTID = ID);
# 5.Query all SQL with grades
select * from STUDENT, COURSE, STUDENT_COURSE where STUDENT.ID = STUDENT_COURSE.STUDENTID and COURSE.ID = STUDENT_COURSE.COURSEID;
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT DISTINCT STUDENT.* FROM STUDENT, STUDENT_COURSE WHERE STUDENT.ID = STUDENT_COURSE.STUDENTID AND STUDENT.ID = 1 AND STUDENT_COURSE.COURSEID = 2;
# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT SCORE FROM STUDENT_COURSE WHERE SCORE < 60 ORDER BY SCORE DESC LIMIT 1;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT COURSEID, AVG(SCORE) FROM STUDENT_COURSE GROUP BY STUDENT_COURSE.COURSEID  ORDER BY AVG(SCORE) DESC, STUDENT_COURSE.COURSEID ASC;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT STUDENT.NAME, SCORE FROM STUDENT, COURSE, STUDENT_COURSE WHERE STUDENT.ID = STUDENTID AND COURSE.ID = COURSEID AND COURSE.NAME = 'Math' AND SCORE < 60; 
