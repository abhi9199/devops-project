FROM centos: latest
MAINTAINER Abhishek.ak80744@gmail.com
RUN yum install -y httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page282/edukate.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip edukate.zip
RUN cp -rvf online-education-website-template/* .
RUN rm -rf online-education-website-template edukate.zip
CMD ["/usr/sbin/httpd", "-D", "FORGROUND"]
EXPOSE 80 22
