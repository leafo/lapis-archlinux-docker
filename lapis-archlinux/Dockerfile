FROM archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

ARG OPENRESTY_VERSION="1.21.4.2"

RUN pacman-key --init && pacman -Sy archlinux-keyring --noconfirm && pacman -Syu base-devel lua51 lua52 lua53 lua postgresql postgresql-libs luarocks redis tup mariadb sqlite libmariadbclient mariadb-clients openssl-1.1 git --noconfirm && (yes | pacman -Scc || :)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz && \
	tar xvfz openresty-${OPENRESTY_VERSION}.tar.gz && \
	(cd openresty-${OPENRESTY_VERSION} && ./configure --with-pcre-jit && make && make install) && \
	rm -rf openresty-${OPENRESTY_VERSION} && rm openresty-${OPENRESTY_VERSION}.tar.gz

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# setup mysql
RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
