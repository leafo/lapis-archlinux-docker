FROM archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

ARG OPENRESTY_VERSION="1.27.1.2"
ARG ESBUILD_VERSION="0.17.18"
ARG COFFEESCRIPT_VERSION="1.12.7"

RUN pacman-key --init && pacman -Sy archlinux-keyring --noconfirm && \
  pacman -Syu base-devel lua51 postgresql postgresql-libs luarocks redis geoip libmaxminddb tup git npm nodejs sassc pygmentize discount openssl-1.1 --noconfirm && \
	(yes | pacman -Scc || :) && \
	npm install -g coffeescript@${COFFEESCRIPT_VERSION} && \
	npm install -g esbuild@${ESBUILD_VERSION}

# setup openresty
RUN curl -O https://openresty.org/download/openresty-${OPENRESTY_VERSION}.tar.gz && \
	tar xvfz openresty-${OPENRESTY_VERSION}.tar.gz && \
	(cd openresty-${OPENRESTY_VERSION} && \
		./configure --with-pcre-jit --with-http_stub_status_module --with-file-aio --with-threads --with-http_realip_module -j4 && \
		make -j 4 && make install) && \
	rm -rf openresty-${OPENRESTY_VERSION} && rm openresty-${OPENRESTY_VERSION}.tar.gz

RUN (echo 'en_US.UTF-8 UTF-8' | sudo tee /etc/locale.gen) && sudo locale-gen && su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# install lua dependencies
COPY itchio-dev-1.rockspec luarocks.lock /

# luaossl doesn't work with normal gcc as of 2025
RUN CC="gcc -std=gnu99" luarocks --lua-version=5.1 install --tree "$HOME/.luarocks" luaossl \
  luarocks --lua-version=5.1 build --tree "$HOME/.luarocks" --only-deps /itchio-dev-1.rockspec
