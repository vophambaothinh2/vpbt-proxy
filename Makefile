
# 34.126.135.224 (VM)


build-run-local:
	docker build -f docker/Dockerfile . -t vpbt-proxy:latest
	docker tag vpbt-proxy vpbt-proxy:beta
	docker run --platform linux/amd64 --network=demo-bridge --name vpbt-proxy-beta -p 60000:60000 -it -d vpbt-proxy:beta


build-run:
	docker build -f docker/Dockerfile_local . -t vpbt-proxy:latest
	docker tag vpbt-proxy vpbt-proxy:beta
	docker run --platform linux/amd64 --network=demo-bridge --name vpbt-proxy-beta -p 60000:60000 -it -d vpbt-proxy:beta

# sudo certbot certonly --manual --preferred-challenges dns -d "*.iot-techx.com"

# docker pull asia.gcr.io/eti-project-355203/vpbt-proxy:v1
# https://www.youtube.com/watch?v=40gKzHQWgP0

# SSL check
# https://www.ssllabs.com/ssltest/analyze.html?d=medi%2dproducts.vophambaothinh.com&latest

# Proxy commands:
# docker run --platform linux/amd64 --net=local-bridge --name vpbt-proxy-beta -p 12000:12000 -it -d vpbt-proxy:beta
# openssl req -x509 -newkey rsa:4096 -sha256 -days 3650  -nodes -keyout result-key.pem -out result-cert.pem -subj "/CN=techbot.app"   -addext "subjectAltName=DNS:*.techbot.app"