FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443


COPY ./conf/default /etc/nginx/sites-enabled/default


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/nginx.crt \
       -keyout /etc/ssl/nginx.key \
       -subj "/C=FR/ST=Lyon/L=Lyon/O=42 School/OU=astachni/CN=astachni/"


CMD ["nginx", "-g", "daemon off;"]
