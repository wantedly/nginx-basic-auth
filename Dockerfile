FROM nginx:1.9.12
MAINTAINER Wantedly Infrastructure Team "dev@wantedly.com"

RUN apt-get update \
  && apt-get install -y wget \
  && wget https://github.com/progrium/entrykit/releases/download/v0.4.0/entrykit_0.4.0_Linux_x86_64.tgz \
  && tar -xvzf entrykit_0.4.0_Linux_x86_64.tgz \
  && rm entrykit_0.4.0_Linux_x86_64.tgz \
  && rm -rf /var/lib/apt/lists/* \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

ENV BACKEND_URL http://localhost:9200
ENV SERVER_NAME elasticsearch

COPY files/nginx.conf.tmpl /etc/nginx/nginx.conf.tmpl

ENV BASIC_AUTH_USER user
ENV BASIC_AUTH_PASSWORD password

COPY files/basic_auth_users.tmpl /etc/nginx/basic_auth_users.tmpl

CMD ["render", "/etc/nginx/nginx.conf", "/etc/nginx/basic_auth_users", "--", "nginx"]
