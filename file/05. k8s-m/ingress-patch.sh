# Ingress CofigMap 설정


# 배스천 호스트(172.16.0.0/24)
# 를 신뢰할 수 있는 프록시로 등록
kubectl patch configmap ingress-nginx-controller -n ingress-nginx --type merge -p '{"data":{"compute-full-forwarded-for":"true","use-forwarded-headers":"true","proxy-real-ip-cidr":"172.16.0.0/24","set-real-ip-from":"172.16.0.1, 172.16.0.0/24"}}'


# 2. 서비스 패치
# 원본 사용자 IP를 그대로 유지하도록 강제
kubectl patch svc ingress-nginx-controller -n ingress-nginx -p '{"spec":{"externalTrafficPolicy":"Local"}}'


# 3. 메인 서비스 접속
# HTTP 요청->HTTPS로 자동 리다이렉트 기능 비활성화
kubectl patch ingress lab-ingress -n locker-view-ns --type merge -p '{"metadata": {"annotations": {"nginx.ingress.kubernetes.io/ssl-redirect": "false", "nginx.ingress.kubernetes.io/force-ssl-redirect": "false"}}}'


# 4. 그라파나 대시보드
# 강제적인 SSL 리다이렉트를 막기
kubectl patch ingress grafana-ingress -n locker-view-ns --type merge -p '{"metadata": {"annotations": {"nginx.ingress.kubernetes.io/ssl-redirect": "false", "nginx.ingress.kubernetes.io/force-ssl-redirect": "false"}}}'