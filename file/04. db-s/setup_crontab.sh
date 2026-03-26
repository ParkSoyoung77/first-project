# 크론탭 설정
vi ~/db_backup.sh
chmod +x ~/db_backup.sh
crontab -e
2
0 3 * * * /bin/bash /home/sy/db_backup.sh >> /home/sy/backup.log 2>&1