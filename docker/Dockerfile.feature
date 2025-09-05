FROM envoyproxy/envoy:v1.34.1

COPY ./docker/front-envoy-dev.yaml /etc/front-envoy.yaml
COPY ./docker/ssl/feature/apicert.key /etc/envoy/ssl/apicert.key
COPY ./docker/ssl/feature/apicert.pem /etc/envoy/ssl/apicert.pem

RUN apt-get update && apt-get install gettext -y


CMD ["/usr/local/bin/envoy", "-c", "/etc/front-envoy.yaml", "--service-cluster", "front-proxy","--log-level", "debug"]
