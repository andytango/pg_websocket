FROM alpine:latest AS builder

WORKDIR /root

RUN wget https://github.com/joewalnes/websocketd/releases/download/v0.3.0/websocketd-0.3.0-linux_amd64.zip
RUN unzip websocketd*.zip websocketd && chmod 755 websocketd

FROM andytango/pg_listen

RUN apk add libc6-compat

ENV WS_PORT 8080
ENV PG_URL ""
ENV PG_CHANNEL websocket

EXPOSE 8080

COPY --from=builder /root/websocketd .
COPY "./run.sh" /usr/local/bin

ENTRYPOINT [ "run.sh" ]