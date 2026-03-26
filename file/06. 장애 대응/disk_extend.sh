# 하드디스크 용량 늘리기

# 1. 파티션 크기 확장 (cfdisk 활용)
sudo cfdisk /dev/sda
/dev/sda3
Resize
Write:yes
Quit

# 2. 변경사항 커널에 알리기
sudo partprobe /dev/sda

# 3. 물리 볼륨 다시 인식
sudo pvresize /dev/sda3

# 4. 논리 볼륨 확장
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
```

# 5. 파일 시스템 사이즈 최종 적용
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv