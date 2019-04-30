FROM alpine

RUN apk add --no-cache bash curl
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT /entrypoint.sh
