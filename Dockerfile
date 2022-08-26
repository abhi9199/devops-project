FROM  centos:latest
MAINTAINER ak80744@gmail.com
RUN wget 'http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/Packages/centos-gpg-keys-8-3.el8.noarch.rpm'
RUN sudo rpm -i 'centos-gpg-keys-8-3.el8.noarch.rpm'
RUN dnf --disablerepo '*' --enablerepo=extras swap centos-linux-repos centos-stream-repos
RUN sudo dnf distro-sync
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
