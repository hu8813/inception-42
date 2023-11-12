FROM debian:bookworm-slim

RUN	apt-get update -y && apt-get install -y nginx openssl

COPY	./conf/nginx.conf	/etc/nginx/conf.d

COPY ./tools/script.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/script.sh"]

EXPOSE	443

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

CMD  ["nginx", "-g", "daemon off;"]
