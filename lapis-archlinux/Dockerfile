FROM finalduty/archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -S base-devel luajit postgresql postgresql-libs luarocks5.1 redis geoip tup mariadb libmariadbclient mariadb-clients openssl-1.0 git --noconfirm && (yes | pacman -Scc)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.11.2.3.tar.gz && \
	tar xvfz openresty-1.11.2.3.tar.gz && \
	(cd openresty-1.11.2.3 && ./configure --with-pcre-jit --with-http_geoip_module --with-cc-opt="-I/usr/include/openssl-1.0" --with-ld-opt="-L/usr/lib/openssl-1.0" && make && make install) && \
	rm -rf openresty-1.11.2.3 && rm openresty-1.11.2.3.tar.gz

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# setup mysql
RUN useradd -r -s /usr/bin/nologin mysql && mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql