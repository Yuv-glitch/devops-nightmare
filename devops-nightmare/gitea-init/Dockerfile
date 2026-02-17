FROM alpine:latest
RUN apk add --no-cache curl git bash
COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
ENTRYPOINT ["/bin/bash", "/setup.sh"]