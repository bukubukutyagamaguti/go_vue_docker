use twiiter_clone;
DROP TABLE IF EXISTS twiiter_clone.posts;
DROP TABLE IF EXISTS twiiter_clone.auths;
DROP TABLE IF EXISTS twiiter_clone.processung_follows;
DROP TABLE IF EXISTS twiiter_clone.follows;
DROP TABLE IF EXISTS twiiter_clone.users;

CREATE TABLE twiiter_clone.users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL unique,
    password VARCHAR(255) NOT NULL,
    token VARCHAR(255) DEFAULT NULL,
    deleted_at DATETIME DEFAULT NULL,
    updated_at DATETIME,
    created_at DATETIME
) ENGINE=INNODB;

INSERT INTO twiiter_clone.users (name, email, password, updated_at, created_at) VALUES 
('テスト太郎', 'test1@test.com', 'password','2022/10/01 15:59:31', '2022/10/01 15:59:31'),
('テスト次郎', 'test2@test.com', 'password','2022/10/22 15:59:31', '2022/10/02 15:59:31'),
('テスト三郎', 'test3@test.com', 'password','2022/10/22 15:59:31', '2022/10/03 15:59:31'),
('テスト四朗', 'test4@test.com', 'password','2022/10/06 15:59:31', '2022/10/04 15:59:31'),
('テスト五郎', 'test5@test.com', 'password','2022/10/07 15:59:31', '2022/10/05 15:59:31'),
('テスト六郎', 'test6@test.com', 'password','2022/10/22 15:59:31', '2022/10/06 15:59:31'),
('テスト七郎', 'test7@test.com', 'password','2022/10/22 15:59:31', '2022/10/07 15:59:31');

CREATE TABLE twiiter_clone.posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message VARCHAR(255) NOT NULL,
    deleted_at DATETIME DEFAULT NULL,
    created_at DATETIME,
    INDEX (user_id),
    FOREIGN KEY (user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE
) ENGINE=INNODB;

INSERT INTO twiiter_clone.posts (user_id, message, created_at) VALUES
('1', 'message1 太郎', '2022/10/03 15:59:31'),
('1', 'message1 太郎', '2022/10/03 15:59:31'),
('1', 'message1 太郎', '2022/10/03 15:59:31'),
('2', 'message1 次郎', '2022/10/03 15:59:31'),
('2', 'message1 次郎', '2022/10/07 15:59:31'),
('2', 'message1 次郎', '2022/10/03 15:59:31'),
('2', 'message1 次郎', '2022/10/03 15:59:31'),
('3', 'message1 三郎', '2022/10/03 15:59:31'),
('3', 'message1 三郎', '2022/10/06 15:59:31'),
('3', 'message1 三郎', '2022/10/07 15:59:31'),
('3', 'message1 三郎', '2022/10/08 15:59:31'),
('4', 'message1 四朗', '2022/10/03 15:59:31'),
('4', 'message1 四朗', '2022/10/03 15:59:31'),
('4', 'message1 四朗', '2022/10/05 15:59:31'),
('4', 'message1 四朗', '2022/10/06 15:59:31'),
('1', 'message1 太郎', '2022/10/06 15:59:31'),
('1', 'message1 太郎', '2022/10/06 16:59:31'),
('1', 'message1 太郎', '2022/10/06 17:59:31'),
('1', 'message1 太郎', '2022/10/06 18:59:31'),
('1', 'message1 太郎', '2022/10/06 19:59:31');

-- CREATE TABLE twiiter_clone.auths (
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     user_id INT, 
--     login_id VARCHAR(50) NOT NULL unique,
--     password VARCHAR(255) NOT NULL,
--     token VARCHAR(255) DEFAULT NULL,
--     deleted_at DATETIME DEFAULT NULL,
--     created_at DATETIME,
--     INDEX (user_id),
--     FOREIGN KEY (user_id) 
--         REFERENCES users(id)
--         ON DELETE CASCADE
-- ) ENGINE=INNODB;

CREATE TABLE twiiter_clone.follows (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT,
    follow_id INT,
    deleted_at DATETIME DEFAULT NULL,
    created_at DATETIME,
    INDEX (user_id, follow_id),
    FOREIGN KEY (user_id) 
        REFERENCES users(id)
        ON DELETE CASCADE,
    FOREIGN KEY (follow_id) 
        REFERENCES users(id)
        ON DELETE CASCADE
    PRIMARY KEY(user_id, follow_id)
) ENGINE=INNODB;

INSERT INTO twiiter_clone.follows (user_id, follow_id, created_at) VALUES
('1', '2', '2022/10/06 19:59:31'),
('1', '3', '2022/10/06 19:59:31'),
('1', '4', '2022/10/06 19:59:31'),
('1', '5', '2022/10/06 19:59:31'),
('1', '6', '2022/10/06 19:59:31'),
('1', '7', '2022/10/06 19:59:31'),
('2', '3', '2022/10/06 19:59:31'),
('2', '4', '2022/10/06 19:59:31'),
('2', '5', '2022/10/06 19:59:31'),
('2', '6', '2022/10/06 19:59:31'),
('2', '7', '2022/10/06 19:59:31'),
('3', '4', '2022/10/06 19:59:31'),
('3', '5', '2022/10/06 19:59:31'),
('3', '6', '2022/10/06 19:59:31'),
('4', '1', '2022/10/06 19:59:31'),
('4', '2', '2022/10/06 19:59:31'),
('4', '3', '2022/10/06 19:59:31'),
('5', '6', '2022/10/06 19:59:31'),
('6', '5', '2022/10/06 19:59:31'),
('7', '1', '2022/10/06 19:59:31'),
('7', '2', '2022/10/06 19:59:31');

-- CREATE TABLE twiiter_clone.processung_follows (
--     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--     user_id INT,
--     followers JSON DEFAULT NULL,
--     follows JSON DEFAULT NULL,
--     updated_at DATETIME,
--     created_at DATETIME,
--     INDEX (user_id),
--     FOREIGN KEY (user_id) 
--         REFERENCES users(id)
--         ON DELETE CASCADE
-- ) ENGINE=INNODB;

-- INSERT INTO follows (user_id, followes, follows, updated_at, created_at) VALUES
-- ('1','["4","7"]','["2","3","4","5","6","7"]','2022/10/06 19:59:31','2022/10/06 19:59:31'),
-- ('7','["1"]','["1","2"]','2022/10/06 19:59:31','2022/10/06 19:59:31');