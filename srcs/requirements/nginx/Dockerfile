FROM debian:bookworm-slim

RUN	apt-get update -y && apt-get install -y nginx openssl

RUN openssl req -new -newkey rsa:4096 -x509 -sha512 -days 365 -nodes \
    -subj "/C=AT/ST=Vienna/O=42/CN=${USER}.42.fr" \
    -out /etc/ssl/certs/nginx_certificate.crt \
    -keyout /etc/ssl/private/nginx_certificate.key

COPY	./conf/nginx.conf	/etc/nginx/conf.d

RUN sed -i 's/huaydin\.42\.fr/${USER}\.42\.fr/g' /etc/nginx/conf.d/nginx.conf

EXPOSE	443

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

CMD  ["nginx", "-g", "daemon off;"]
