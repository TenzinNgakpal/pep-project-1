FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        apache2 \
        libapache2-mod-php \
        php-gd \
        php-cli \
        build-essential \
        libgd-dev \
        libssl-dev \
        openssl \
        unzip \
        wget \
        nagios-plugins \
        nagios-nrpe-server \
        nagios-nrpe-plugin \
        net-tools \
        fping \
        mailutils \
        sudo && \
    rm -rf /var/lib/apt/lists/*

ARG NAGIOS_VERSION=4.4.10 # Specify a Nagios Core version
RUN wget -O /tmp/nagios.tar.gz "https://github.com/NagiosEnterprises/nagioscore/archive/nagios-${NAGIOS_VERSION}.tar.gz" && \
    tar xzf /tmp/nagios.tar.gz -C /tmp/ && \
    mv /tmp/nagioscore-nagios-${NAGIOS_VERSION} /tmp/nagioscore

RUN cd /tmp/nagioscore && \
    ./configure --with-httpd-conf=/etc/apache2/sites-enabled --with-nagios-user=nagios --with-nagios-group=nagios && \
    make all && \
    make install && \
    make install-init && \
    make install-config && \
    make install-webconf && \
    make install-commandmode && \
    make install-daemoninit && \
    make install-exfoliation && \
    make install-html && \
    make install-gd-devel && \
    make install-php && \
    make install-plugins && \
    make install-nrpe && \
    make install-nrpe-plugin && \
    make install-nrpe-server && \
    rm -rf /tmp/nagioscore /tmp/nagios.tar.gz

COPY etc/ /opt/nagios/etc/
COPY etc/plugins/check_docker_container.sh /usr/lib/nagios/plugins/check_docker_container.sh
RUN chmod +x /usr/lib/nagios/plugins/check_docker_container.sh

RUN a2enmod cgi rewrite && \
    htpasswd -cb /opt/nagios/etc/htpasswd.users nagiosadmin nagiospassword # IMPORTANT: Change default password!
RUN chown -R nagios:nagios /opt/nagios/var/rw && \
    chmod g+rwx /opt/nagios/var/rw

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
