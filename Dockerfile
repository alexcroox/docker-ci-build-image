FROM debian:jessie
MAINTAINER alex@sidigital.co

USER root
RUN apt-get --yes --force-yes update \
    && apt-get install --yes --force-yes curl \
    && apt-get install bzip2 \
    && echo "deb http://packages.dotdeb.org jessie all" > /etc/apt/sources.list.d/dotdeb.list \
    && curl -sS https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
    && apt-get update -qq -y \
    && apt-get --yes --force-yes install php7.0-cli php7.0-apcu php7.0-apcu-bc php7.0-curl php7.0-json php7.0-mcrypt php7.0-opcache php7.0-readline php7.0-mysql php7.0-xml php7.0-zip php7.0-mbstring php7.0-gd php7.0-intl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get install --yes --force-yes python3 \
    && apt-get install python3-pip --yes --force-yes \
    && apt-get install libyaml-dev --yes --force-yes \
    && pip3 install awscli --upgrade

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - &&\
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash &&\
    apt-get install -y nodejs git &&\
    npm install -g bower &&\
    npm install -g gulp &&\
    npm install -g sass &&\
    npm install -g serverless &&\
    npm install -g gatsby-cli &&\
    npm install -g stylus
