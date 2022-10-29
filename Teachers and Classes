--create school database

CREATE TABLE teachers 
    (id INTEGER PRIMARY KEY,
    name TEXT,
    subject TEXT,
    department TEXT);
    
INSERT INTO teachers (name, subject, department) Values ("Miranda", "Ag Chemistry", "Science");
INSERT INTO teachers (name, subject, department) Values ("Miranda", "Sustainable Ag", "Science");
INSERT INTO teachers (name, subject, department) Values ("Munn", "Ag Biology", "Science");
INSERT INTO teachers (name, subject, department) Values ("Munn", "Plant and Animal", "Science");
INSERT INTO teachers (name, subject, department) Values ("Niederfrank", "Ag Science", "Science");
INSERT INTO teachers (name, subject, department) Values ("Niederfrank", "Ag Biology", "Science");
INSERT INTO teachers (name, subject, department) Values ("Gonzalez", "Ag Biology", "Science");
INSERT INTO teachers (name, subject, department) Values ("Gonzalez", "Plant and Animal", "Science");
INSERT INTO teachers (name, subject, department) Values ("Stuhr", "Basic Fab", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Stuhr", "ROP Welding", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Stuhr", "Welding 1", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Carpenter", "Construction", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Carpenter", "ROP Construction", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Carpenter", "Basic Fab", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Barcellos", "ROP Floral", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Barcellos", "Floral", "CTE");
INSERT INTO teachers (name, subject, department) Values ("Barcellos", "Basic Fab", "CTE");

CREATE TABLE grade_levels 
    (id INTEGER PRIMARY KEY,
    class_name TEXT,
    grade INTEGER);
    
INSERT INTO grade_levels (class_name, grade) VALUES ("Ag Chemistry", 10);
INSERT INTO grade_levels (class_name, grade) VALUES ("Ag Chemistry", 11);
INSERT INTO grade_levels (class_name, grade) VALUES ("Sustainable Ag", 12);
INSERT INTO grade_levels (class_name, grade) VALUES ("Ag Biology", 9);
INSERT INTO grade_levels (class_name, grade) VALUES ("Plant and Animal", 10);
INSERT INTO grade_levels (class_name, grade) VALUES ("Plant and Animal", 11);
INSERT INTO grade_levels (class_name, grade) VALUES ("Ag Science", 9);
INSERT INTO grade_levels (class_name, grade) VALUES ("Basic Fab", 9);
INSERT INTO grade_levels (class_name, grade) VALUES ("Welding 1", 10);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Welding", 11);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Welding", 12);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Construction", 11);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Construction", 12);
INSERT INTO grade_levels (class_name, grade) VALUES ("Construction", 10);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Floral", 11);
INSERT INTO grade_levels (class_name, grade) VALUES ("ROP Floral", 12);
INSERT INTO grade_levels (class_name, grade) VALUES ("Floral", 10);

--what subjects does each teacher teach and what grade levels can take those classes?
SELECT t.name, t.subject, g.grade
FROM teachers t
JOIN grade_levels g
ON t.subject = g.class_name
ORDER BY t.name asc;

--what teachers could a 9th grader possibly get?
SELECT t.name, g.grade
FROM teachers t
JOIN grade_levels g
ON t.subject = g.class_name
WHERE grade = 9
GROUP BY t.name;

--what grade levels does each teacher teach?
SELECT t.name, g.grade
FROM teachers t
JOIN grade_levels g
ON t.subject = g.class_name
ORDER BY t.name, g.grade asc;
        
