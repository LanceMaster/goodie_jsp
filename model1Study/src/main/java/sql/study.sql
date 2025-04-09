-- /java/sql/study.sql

CREATE TABLE `member` (
    id VARCHAR(20) PRIMARY KEY,
    pass VARCHAR(20),
    name VARCHAR(20),
    gender INT(1),
    tel VARCHAR(15),
    email VARCHAR(50),
    picture VARCHAR(200)
);

SELECT * FROM `member`;