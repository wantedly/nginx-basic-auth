# nginx-basic-auth

[![Docker Repository on Quay.io](https://quay.io/repository/wantedly/nginx-basic-auth/status "Docker Repository on Quay.io")](https://quay.io/repository/wantedly/nginx-basic-auth)

Nginx to add basic auth functionality to the backend


## How to use

At first, generate `your_auth_password` by `htpasswd` command.

```bash
$ htpasswd -c .htpasswd hoge
New password:
Re-type new password:
Adding password for user hoge

$ cat .htpasswd
hoge:$apr1$RQ5Y56MB$ZssnUWsCOytPU8WxXTFcs.
     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

Then launch Docker container.

```
$ docker run -d --rm \
  -p 80:80 \
  -e BACKEND_URL=http://localhost:9200 \
  -e SERVER_NAME=Elasticsearch \
  -e BASIC_AUTH_USER=your_auth_user \
  -e BASIC_AUTH_PASSWORD=your_auth_password \
  --name elasticsearch-proxy-example \
  --net host
```
