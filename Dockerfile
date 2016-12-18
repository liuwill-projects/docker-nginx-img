FROM index.tenxcloud.com/tenxcloud/docker-centos
#FROM centos

MAINTAINER Will Liu, liuwill@live.com

RUN yum install -y gd-devel wget \
	&& yum -y install gcc gcc-c++ kernel-devel make \
	&& mkdir /home/liuwill \
	&& cd /home/liuwill \
	&& wget http://nginx.org/download/nginx-1.11.7.tar.gz \
	&& tar -xzvf nginx-1.11.7.tar.gz \
	&& wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz \ 
	&& tar -xzvf pcre-8.39.tar.gz \
	&& cd nginx-1.11.7 \
	&& ./configure --prefix=/usr/local/nginx --with-http_image_filter_module --with-pcre=../pcre-8.39 \
	&& make \
	&& make install
	
#RUN echo -e 'PATH=$PATH:/usr/local/nginx/sbin\nexport PATH' >> /etc/profile 
#RUN source /etc/profile

ENV	PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/nginx/sbin

WORKDIR /var/www

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
