-- Base de données Blueline
CREATE DATABASE IF NOT EXISTS blueline_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Utilisateur applicatif
CREATE USER IF NOT EXISTS 'blueline_user'@'%' IDENTIFIED BY 'blueline_password_2024';
GRANT ALL PRIVILEGES ON blueline_db.* TO 'blueline_user'@'%';

FLUSH PRIVILEGES;

USE blueline_db;

-- Table des services (pour suivre nos containers)
CREATE TABLE IF NOT EXISTS services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    service_type ENUM('web', 'database', 'load_balancer') NOT NULL,
    container_name VARCHAR(100),
    port INT,
    status ENUM('running', 'stopped', 'error') DEFAULT 'stopped',
    last_check TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insertion des services actuels
INSERT INTO services (service_name, service_type, container_name, port, status) VALUES
('Apache Web Server', 'web', 'apache-lab', 8080, 'running'),
('Nginx Web Server', 'web', 'nginx-lab', 8081, 'running'),
('MySQL Database', 'database', 'mysql-lab', 3306, 'running'),
('Load Balancer', 'load_balancer', 'lb-lab', 8082, 'running');

-- Table des logs système
CREATE TABLE IF NOT EXISTS system_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100),
    log_level ENUM('INFO', 'WARNING', 'ERROR') NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Logs d'initialisation
INSERT INTO system_logs (service_name, log_level, message) VALUES
('MySQL', 'INFO', 'Base de données Blueline initialisée avec succès'),
('System', 'INFO', 'Conteneurisation des services web terminée');
