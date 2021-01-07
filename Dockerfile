FROM archlinux/base:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -Sy base-devel lua51 lua52 lua53 lua postgresql postgresql-libs luarocks redis geoip tup mariadb libmariadbclient mariadb-clients openssl-1.0 git --noconfirm && (yes | pacman -Scc || :)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.19.3.1.tar.gz && \
	tar xvfz openresty-1.19.3.1.tar.gz && \
	(cd openresty-1.19.3.1 && ./configure --with-pcre-jit --with-http_geoip_module --with-cc-opt="-I/usr/include/openssl-1.0" --with-ld-opt="-L/usr/lib/openssl-1.0" && make && make install) && \
	rm -rf openresty-1.19.3.1 && rm openresty-1.19.3.1.tar.gz

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# setup mysql
RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql