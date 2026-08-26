FROM archlinux:latest
LABEL org.opencontainers.image.authors="leaf corcoran <leafot@gmail.com>"

ARG OPENRESTY_VERSION="1.31.1.1"

RUN pacman-key --init && pacman -Sy archlinux-keyring --noconfirm && \
	pacman -Syu base-devel lua51 lua52 lua53 lua54 lua postgresql postgresql-libs luarocks lua51-luarocks valkey tup mariadb sqlite mariadb-clients git --noconfirm && \
	(yes | pacman -Scc || :)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz && \
	tar xvfz openresty-${OPENRESTY_VERSION}.tar.gz && \
	(cd openresty-${OPENRESTY_VERSION} && \
		./configure --with-pcre-jit --with-http_stub_status_module --with-file-aio --with-threads --with-http_realip_module --with-http_gzip_static_module -j4 && \
		make -j 4 && make install) && \
	rm -rf openresty-${OPENRESTY_VERSION} && rm openresty-${OPENRESTY_VERSION}.tar.gz

# setup postgresql
RUN (echo 'en_US.UTF-8 UTF-8' | sudo tee /etc/locale.gen) && sudo locale-gen && su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# setup mysql
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
