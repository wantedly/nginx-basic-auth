FROM nginx:1.9.12
MAINTAINER Wantedly Infrastructure Team "dev@wantedly.com"

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/run.sh /run.sh

ENV BASIC_AUTH_USER user
ENV BASIC_AUTH_PASSWORD password

CMD ["./run.sh"]
