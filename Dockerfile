# base this image on the PHP image that comes with Apache https://hub.docker.com/_/php/
FROM php:7.0-apache

# install mysql-client and curl for our data init script
# install the PHP extension pdo_mysql for our connection script
# clean up
RUN apt-get update \
  && apt-get install -y mysql-client curl \
  && apt-get install -y libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip
  && docker-php-ext-install pdo_mysql \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives

# take the contents of the local html/ folder, and copy to /var/www/html/ inside the container
# this is the expected web root of the default website for this server, so put your index.php here
COPY html/ /var/www/html/

# take the contents of the local script/ folder, and copy to /tmp/ inside the container
# we can run one-time scripts, downloads, and other initial processes from /tmp/
COPY script/ /tmp/
