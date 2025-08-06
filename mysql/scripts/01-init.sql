CREATE DATABASE IF NOT EXISTS blueline_db;
USE blueline_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email)
VALUES ('admin', 'admin@blueline.com'),
       ('tafara', 'tafara@blueline.com');
