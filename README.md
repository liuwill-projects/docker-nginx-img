# Nginx 图片裁剪 Container

> Docker nginx img simple config

1 执行下面的docker命令

### 执行

```
docker build -t liuwill/nginx-img .

docker run --name img_nginx -v /home/liuwill/nginx-img/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf:ro -d -p 8080:80 -p 8443:443 liuwill/nginx-img

docker run --name img_nginx -v /home/liuwill/nginx-img/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf:ro -it -p 8080:80 -p 8443:443 liuwill/nginx-img /bin/bash
```