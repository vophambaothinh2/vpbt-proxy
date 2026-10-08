FROM envoyproxy/envoy:v1.34.1

COPY ./docker/front-envoy-dev.yaml /etc/front-envoy.yaml

COPY ./docker/ssl/feature/vpbt-ca_2025.crt /etc/envoy/ssl/vpbt-ca_2025.crt
COPY ./docker/ssl/feature/vpbt-server_2025.crt /etc/envoy/ssl/vpbt-server_2025.crt
COPY ./docker/ssl/feature/vpbt-server_2025.key /etc/envoy/ssl/vpbt-server_2025.key

RUN apt-get update

CMD ["/usr/local/bin/envoy", "-c", "/etc/front-envoy.yaml", "--service-cluster", "front-proxy","--log-level", "debug"]
