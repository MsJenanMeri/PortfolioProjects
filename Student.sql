/* Creating school system database */
CREATE DATABASE schoolDistrict;

/* Verifying data is clean and correct */
SELECT *
FROM schooldistrict.studentpopulation;

/* Comparing the amount of female vs male students */
SELECT sex AS gender, COUNT(*) AS numberOfStudents
FROM schooldistrict.studentpopulation
GROUP BY sex;

/* Showcasing the average age of students */
SELECT ROUND(AVG(age), 0) AS averageAgeOfStudent
FROM schooldistrict.studentpopulation;

/* Displaying the distribution of family sizes */
SELECT famsize, COUNT(*) AS amount, (ROUND(COUNT(*) * 100, 1) / 649) AS percentageOfEachFamily
FROM schooldistrict.studentpopulation
GROUP BY famsize;

/* Looking into Student's parents Education and their absence count*/
SELECT ROUND((Medu + Fedu)/2, 0) AS averageLevelOfParentsEducation, COUNT(absences) AS numberOfAbsences
FROM schooldistrict.studentpopulation
GROUP BY 1
ORDER BY 1;

/* Counting the amount of students who want to pursue higer education */
SELECT higher, COUNT(*) AS amountOfStudentsWhoPursueHigherEd
FROM schooldistrict.studentpopulation
GROUP BY higher;



