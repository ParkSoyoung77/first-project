-- 마스터DB(maridb)
SHOW MASTER STATUS;

CHANGE MASTER TO
  MASTER_HOST='172.16.0.8',          -- 마스터 DB의 내부 IP
  MASTER_USER='repl_user',           -- 복제 전용 계정
  MASTER_PASSWORD='1234',            -- 복제 계정 비밀번호
  MASTER_LOG_FILE='mysql-bin.000003', -- 위에서 확인한 File 이름
  MASTER_LOG_POS=328;                -- 위에서 확인한 Position 번호

START SLAVE;

SHOW SLAVE HOSTS;


-- 슬레이브DB(maridb)
-- 복제가 잘 돌아가는지 상세 확인
SHOW SLAVE STATUS\G 