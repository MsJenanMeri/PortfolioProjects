/* 
Create Database for Enrollment 
of Students in School Systems
*/
CREATE DATABASE Enrollment;
USE Enrollment;

/* 
Create table Department to keep of track of
School Departments
*/
CREATE TABLE enrollment.Department(
	DepartmentID TINYINT NOT NULL,
    DepartmentNm VARCHAR(40) NOT NULL,
    DepartmentAcronym CHAR(10),
    PRIMARY KEY(DepartmentID)
);

DESCRIBE enrollment.Department;

/*
Insert Department Information into
Department Table
*/
INSERT INTO enrollment.Department (DepartmentID, DepartmentNm, DepartmentAcronym) VALUES (1, 'Computer Science', 'CS');
INSERT INTO enrollment.Department (DepartmentID, DepartmentNm, DepartmentAcronym) VALUES (2, 'Information Sciences', 'INFO');
INSERT INTO enrollment.Department (DepartmentID, DepartmentNm, DepartmentAcronym) VALUES (3, 'Data Science', 'DS');
INSERT INTO enrollment.Department (DepartmentID, DepartmentNm, DepartmentAcronym) VALUES (4, 'Marketing', 'MKT');
INSERT INTO enrollment.Department (DepartmentID, DepartmentNm, DepartmentAcronym) VALUES (5, 'Engineering & Technology Management', 'ETM');

/*
Querying  all the information
in the Department Table
*/
SELECT *
FROM enrollment.Department
ORDER BY DepartmentID;

/* 
Create table Student to keep of track of
School Students
*/
CREATE TABLE enrollment.Student(
	StudentID INTEGER NOT NULL,
    DepartmentID TINYINT NOT NULL,
    StudentFirstNm VARCHAR(20) NOT NULL,
    StudentLastNm VARCHAR(20) NOT NULL,
    EnrollmentDt DATE NOT NULL,
    StudentPhoneTxt VARCHAR(15),
    StudentAddress VARCHAR(50),
    StudentCityNm VARCHAR(20),
    StudentStateCd CHAR(2),
    StudentZipCd CHAr(5),
    PRIMARY KEY(StudentID),
    CONSTRAINT Emp_DeptID_fk FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID)
);

DESCRIBE enrollment.Student;

/*
Insert Student Information into
Student Table
*/
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (100, 1, 'Victor', 'Evans', '2022-01-15', '(937) 795-0198', '8471 State 41 Rte', 'West Union', 'OH', '45693');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (101, 3, 'Julia', 'Mitchell', '2021-11-15', '(231) 652-9265', '636 E Kathy St', 'Newaygo', 'MI', '49337');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (102, 4, 'Anna', 'Stewart', '2023-01-18', '(607) 292-6272', '1040 E Lake Rd', 'Dundee', 'NY', '14837');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (103, 5, 'Adele', 'Andrews', '2023-03-19', '(810) 732-6788', '1468 Dyemeadow Ln', 'Flint', 'MI', '48532');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (104, 2, 'Ryan', 'Elliot', '2022-03-23', '(828) 765-1438', '117 Brights Trce', 'Spruce Pine', 'NC', '28777');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (105, 1, 'Leonardo', 'Baker', '2023-04-11', '(336) 376-1149', '9144 Sylvan Rd', 'Liberty', 'NC', '27298');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (106, 2, 'Alfred', 'Turner', '2022-08-10', '(334) 288-6988', '431 Rolling Acres Rd', 'Hope Hull', 'AL', '36043');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (107, 1, 'Luke', 'Hawkins', '2022-08-01', '(530) 525-7340', '6680 W Lake Blvd', 'Tahoma', 'CA', '96142');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (108, 3, 'Kristian', 'Cole', '2021-08-09', '(801) 295-9358', '1381 N 200th W', 'Centerville', 'UT', '84014');
INSERT INTO enrollment.Student (StudentID, DepartmentID, StudentFirstNm, StudentLastNm, EnrollmentDt, StudentPhoneTxt, StudentAddress, StudentCityNm, StudentStateCd, StudentZipCd) VALUES (109, 4, 'Amanda', 'Casey', '2023-01-03', '(530) 938-1191', '220 Terrace St', 'Weed', 'CA', '96094');

/*
Querying  all the information
in the Student Table
*/
SELECT *
FROM enrollment.Student
ORDER BY StudentID;

/* 
Create table Course to keep of track of
School Courses
*/
CREATE TABLE enrollment.Course(
	CourseID CHAR(10) NOT NULL,
    CourseSectionNbr TINYINT NOT NULL,
    CourseNm VARCHAR(60) NOT NULL,
    CourseCreditCnt TINYINT NOT NULL,
    PRIMARY KEY(CourseID, CourseSectionNbr)
);

DESCRIBE enrollment.Course;

/*
Insert Course Information into
Student Table
*/
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('STAT 461', 1, 'Applied Statistics', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('DS 344', 2, 'Introduction to Big Data', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('DS 436', 2, 'Data Analytics with Python Programming', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('CS 575', 1, 'Machine Learning', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('CS 577', 1, 'Deep Learning', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('INFO 579', 2, 'SQL/NoSQL Databases for Data and Information Sciences', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('INFO 531', 2, 'Data Warehousing and Analytics in the Cloud', 3);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('ETM 533', 1, 'Technology Transfer', 4);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('MKT 300', 2, 'Marketing Strategy', 4);
INSERT INTO enrollment.Course (CourseID, CourseSectionNbr, CourseNm, CourseCreditCnt) VALUES ('MKT 420', 1, 'Research Methodology', 4);

/*
Querying  all the information
in the Course Table
*/
SELECT *
FROM enrollment.Course
ORDER BY CourseID, CourseSectionNbr;

/* 
Create table StudentCourse to keep of track of
each students courses
*/
CREATE TABLE enrollment.StudentCourse (
    StudentID INTEGER NOT NULL,
    CourseID CHAR(10) NOT NULL,
    CourseSectionNbr TINYINT NOT NULL,
    CourseGradeTxt CHAR(1),
    PRIMARY KEY (StudentID, CourseID, CourseSectionNbr),
    CONSTRAINT Emp_StudentID_fk FOREIGN KEY(StudentID) REFERENCES Student(StudentID),
    CONSTRAINT Emp_CourseID_fk FOREIGN KEY(CourseID) REFERENCES Course(CourseID),
    CONSTRAINT Emp_CourseSectionNbr_fk FOREIGN KEY(CourseID, CourseSectionNbr) REFERENCES Course(CourseID, CourseSectionNbr)
);

DESCRIBE enrollment.StudentCourse;

/*
Insert Students Courses Information into
StudentCourse Table
*/
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (100, 'STAT 461', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (100, 'CS 575', 1, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (101, 'DS 436', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (101, 'CS 575', 1, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (102, 'ETM 533', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (102, 'MKT 420', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (103, 'ETM 533', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (103, 'MKT 300', 2, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (104, 'INFO 579', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (104, 'INFO 531', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (104, 'STAT 461', 1, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (105, 'CS 575', 1, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (105, 'CS 577', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (105, 'INFO 579', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (106, 'DS 436', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (106, 'INFO 579', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (107, 'DS 436', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (107, 'CS 575', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (107, 'CS 577', 1, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (108, 'DS 436', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (108, 'INFO 579', 2, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (108, 'INFO 531', 2, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (109, 'MKT 300', 2, 'B');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (109, 'MKT 420', 1, 'A');
INSERT INTO enrollment.StudentCourse (StudentID, CourseID, CourseSectionNbr, CourseGradeTxt) VALUES (109, 'DS 344', 2, NULL);

/*
Querying  all the information
in the StudentCourse Table
*/
SELECT *
FROM enrollment.StudentCourse
ORDER BY StudentID, CourseID, CourseSectionNbr;

/* 
Create table Faculty to keep of track of
the Faculty at the School
*/
CREATE TABLE enrollment.Faculty ( 
	FacultyID SMALLINT NOT NULL,
    FacultyFirstNm VARCHAR(20),
    FacultyLastNm VARCHAR(20) NOT NULL,
    FacultyPhoneTxt VARCHAR(15) NOT NULL,
    PRIMARY KEY(FacultyID)
);

DESCRIBE enrollment.Faculty;

/*
Insert Faculty Information into
Faculty Table
*/
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (1, 'David', 'Gerbing', '(503) 222-4444');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (2, 'Shameem', 'Akhter', '(123) 231-4247');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (3, 'Eva', 'Askarza', '(602) 928-5155');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (4, 'Li', 'Xu', '(928) 212-9282');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (5, 'Nayem', 'Rahman', '(302) 189-1224');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (6, NULL, 'Zuick', '(131) 938-1268');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (7, 'Mohib', 'Rahman', '(849) 145-1214');
INSERT INTO enrollment.Faculty (FacultyID, FacultyFirstNm, FacultyLastNm, FacultyPhoneTxt) VALUES (8, 'Tugrul', 'Daim', '(702) 321-8914');

/*
Querying  all the information
in the Faculty Table
*/
SELECT *
FROM enrollment.Faculty
ORDER BY FacultyID;

/* 
Create table CourseFaculty to keep of track of
the courses that the faculty teach at the School
*/
CREATE TABLE enrollment.CourseFaculty (
	FacultyID SMALLINT NOT NULL,
    CourseID CHAR(10) NOT NULL,
    CourseSectionNbr TINYINT NOT NULL,
    PRIMARY KEY(FacultyID, CourseID, CourseSectionNbr),
    CONSTRAINT Emp_FacultyID_fk FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID),
    CONSTRAINT Emp_CourseFacultyID_fk FOREIGN KEY(CourseID) REFERENCES Course(CourseID),
    CONSTRAINT Emp_CourseFacultySectionNbr_fk FOREIGN KEY(CourseID, CourseSectionNbr) REFERENCES Course(CourseID, CourseSectionNbr)
);

DESCRIBE enrollment.CourseFaculty;

/*
Insert the course information for each 
faculty  into Faculty Table
*/
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (1, 'STAT 461', 1);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (2, 'DS 344', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (3, 'DS 344', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (4, 'DS 436', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (5, 'DS 436', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (6, 'CS 575', 1);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (7, 'CS 575', 1);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (4, 'CS 577', 1);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (5, 'INFO 579', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (5, 'INFO 531', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (8, 'ETM 533', 1);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (3, 'MKT 300', 2);
INSERT INTO enrollment.CourseFaculty (FacultyID, CourseID, CourseSectionNbr) VALUES (1, 'MKT 420', 1);

/*
Querying  all the information
in the CourseFaculty Table
*/
SELECT * 
FROM enrollment.CourseFaculty
ORDER BY FacultyID, CourseID, CourseSectionNbr;

/*
Looking for Null  values
to eliminate 
*/
SELECT *
FROM enrollment.Faculty
WHERE FacultyFirstNm is NULL
ORDER BY FacultyID;

/*
Looking for Students who
enrolled in the year 2023
*/
SELECT *
FROM enrollment.Student
WHERE EnrollmentDt BETWEEN '2023-01-01' AND '2023-12-31';

/*
Showing all tables in the 
enrollment Database 
*/
SHOW TABLES;