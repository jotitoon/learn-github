-- Crear la base de datos y la tabla para logs de acceso
USE access_logs_db;

CREATE TABLE access_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ip_address VARCHAR(45),
    timestamp DATETIME,
    event_type VARCHAR(50),
    result VARCHAR(10)
);

-- Insertar registros de ejemplo: varios intentos fallidos desde la misma IP
INSERT INTO access_logs (ip_address, timestamp, event_type, result) VALUES 
('192.168.1.100', NOW() - INTERVAL 20 MINUTE, 'login', 'failed'),
('192.168.1.100', NOW() - INTERVAL 19 MINUTE, 'login', 'failed'),
('192.168.1.100', NOW() - INTERVAL 18 MINUTE, 'login', 'failed'),
('192.168.1.100', NOW() - INTERVAL 17 MINUTE, 'login', 'failed'),
('192.168.1.100', NOW() - INTERVAL 16 MINUTE, 'login', 'failed'),
('192.168.1.100', NOW() - INTERVAL 15 MINUTE, 'login', 'failed'),
-- También un registro exitoso de otra IP para contraste
('192.168.1.101', NOW() - INTERVAL 10 MINUTE, 'login', 'success');
