
-- SOAL A 1
CREATE DATABASE IF NOT EXISTS sekolahku;

USE sekolahku;

CREATE TABLE IF NOT EXISTS users (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, password) VALUES
('Andi', 'andi@andi.com', '12345678'),
('Budi', 'budi@budi.com', '12345678'),
('Caca', 'caca@caca.com', '12345678'),
('Deni', 'deni@deni.com', '12345678'),
('Euis', 'euis@euis.com', '12345678'),
('Fafa', 'fafa@fafa.com', '12345678');

-- SOAL A 2
CREATE TABLE IF NOT EXISTS courses (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    course VARCHAR(50),
    mentor VARCHAR(50),
    title VARCHAR(50)
);

INSERT INTO courses (course, mentor, title) VALUES
('C++', 'Ari', 'Dr.'),
('C#', 'Ari', 'Dr.'),
('C#', 'Ari', 'Dr.'),
('CSS', 'Cania', 'S.Kom'),
('HTML', 'Cania', 'S.Kom'),
('Javascript', 'Cania', 'S.Kom'),
('Python', 'Barry', 'S.T.'),
('Micropython', 'Barry', 'S.T.'),
('Java', 'Darren', 'M.T.'),
('Ruby', 'Darren', 'M.T.');

-- SOAL A 3
CREATE TABLE IF NOT EXISTS userCourse (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_user INT(11),
    id_course INT(11),
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_course) REFERENCES courses(id)
);

INSERT INTO userCourse (id_user, id_course) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 1),
(4, 3),
(4, 5),
(5, 2),
(5, 4),
(5, 6),
(6, 7),
(6, 8),
(6, 9);

-- SOAL A 4
SELECT users.username, courses.*
FROM users
JOIN userCourse ON users.id = userCourse.id_user
JOIN courses ON userCourse.id_course = courses.id;

-- SOAL A 5
SELECT users.username, courses.*
FROM users
JOIN userCourse ON users.id = userCourse.id_user
JOIN courses ON userCourse.id_course = courses.id
WHERE courses.title NOT IN ('M.T.', 'Dr.');

-- SOAL A 6
SELECT users.username, courses.*
FROM users
JOIN userCourse ON users.id = userCourse.id_user
JOIN courses ON userCourse.id_course = courses.id
WHERE courses.title IN ('M.T.', 'Dr.');

-- SOAL A 7
SELECT courses.course, courses.mentor, courses.title, COUNT(userCourse.id_user) AS jumlah_peserta
FROM courses
LEFT JOIN userCourse ON courses.id = userCourse.id_course
GROUP BY courses.course, courses.mentor, courses.title;

-- SOAL A 8
SELECT 
    courses.mentor, 
    COUNT(userCourse.id_user) AS jumlah_peserta, 
    COUNT(userCourse.id_user) * 2000000 AS total_fee
FROM 
    courses
JOIN 
    userCourse ON courses.id = userCourse.id_course
GROUP BY 
    courses.mentor;