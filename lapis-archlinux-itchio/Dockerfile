FROM finalduty/archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -S base-devel luajit postgresql postgresql-libs luarocks5.1 redis geoip --noconfirm && pacman -Scc --noconfirm

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.11.2.1.tar.gz
RUN tar xvfz openresty-1.11.2.1.tar.gz
RUN cd openresty-1.11.2.1 && ./configure --with-pcre-jit --with-http_geoip_module && make && make install

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'"