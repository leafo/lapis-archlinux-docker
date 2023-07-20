FROM archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

ARG OPENRESTY_VERSION="1.21.4.2"

RUN pacman -Sy base-devel lua51 postgresql postgresql-libs luarocks redis geoip libmaxminddb tup git npm sassc pygmentize discount openssl-1.1 --noconfirm && \
	(yes | pacman -Scc || :) && \
	npm install -g coffeescript@1.12.7 && \
	npm install -g esbuild@0.17.18

# setup openresty
RUN curl -O https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz && \
	tar xvfz openresty-${OPENRESTY_VERSION}.tar.gz && \
	(cd openresty-${OPENRESTY_VERSION} && \
		./configure --with-pcre-jit && \
		make && make install) && \
	rm -rf openresty-${OPENRESTY_VERSION} && rm openresty-${OPENRESTY_VERSION}.tar.gz

RUN (echo 'en_US.UTF-8 UTF-8' | sudo tee /etc/locale.gen) && sudo locale-gen && su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# install lua dependencies
COPY itchio-dev-1.rockspec luarocks.lock /
RUN luarocks --lua-version=5.1 build --tree "$HOME/.luarocks" --only-deps /itchio-dev-1.rockspec
