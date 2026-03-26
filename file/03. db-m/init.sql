-- 1. 데이터베이스 생성 및 선택
CREATE DATABASE IF NOT EXISTS locker_system;
USE locker_system;

-- 2. 사물함 테이블 생성 (제약 조건 강화)
CREATE TABLE IF NOT EXISTS lockers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    station_name VARCHAR(20) NOT NULL,        -- 서울역, 부산역, 대구역
    locker_num INT NOT NULL,                  -- 각 역의 사물함 번호 (1~12)
    password VARCHAR(100) NOT NULL DEFAULT '0000', -- 초기값 0000, 예약 시 4자리 필수
    phone VARCHAR(20),                        -- 예약자 연락처
    status ENUM('available', 'occupied') DEFAULT 'available',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- [보안 강화] 비밀번호는 반드시 숫자 4자리여야 함
    CONSTRAINT chk_password_format CHECK (password REGEXP '^[0-9]{4}$'),
    
    -- [데이터 무결성] 한 역에 동일한 사물함 번호 중복 방지
    UNIQUE KEY unique_locker (station_name, locker_num)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. 초기 데이터 삽입 (3개 역 x 12개 = 총 36개)
-- 서울역 초기화
INSERT INTO lockers (station_name, locker_num) 
SELECT '서울역', n FROM (
    SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) AS nums;

-- 부산역 초기화
INSERT INTO lockers (station_name, locker_num) 
SELECT '부산역', n FROM (
    SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) AS nums;

-- 대구역 초기화
INSERT INTO lockers (station_name, locker_num) 
SELECT '대구역', n FROM (
    SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 
    UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
) AS nums;