FROM alpine
RUN apk -Uuv add curl ca-certificates python \
    && rm -rf /var/cache/apk/*

ADD script.sh /bin/
RUN chmod +x /bin/script.sh
ENTRYPOINT /bin/script.sh
