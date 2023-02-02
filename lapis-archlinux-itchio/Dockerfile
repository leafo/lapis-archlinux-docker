FROM archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -Sy base-devel lua51 postgresql postgresql-libs luarocks redis geoip libmaxminddb tup git npm sassc pygmentize discount --noconfirm && \
	(yes | pacman -Scc || :) && \
	npm install -g coffeescript@1.12.7 && \
	npm install -g uglify-js

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.21.4.1.tar.gz && \
	tar xvfz openresty-1.21.4.1.tar.gz && \
	(cd openresty-1.21.4.1 && \
		./configure --with-pcre-jit && \
		make && make install) && \
	rm -rf openresty-1.21.4.1 && rm openresty-1.21.4.1.tar.gz

RUN (echo 'en_US.UTF-8 UTF-8' | sudo tee /etc/locale.gen) && sudo locale-gen && su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# install lua dependencies
COPY itchio-dev-1.rockspec luarocks.lock /
RUN luarocks --lua-version=5.1 build --tree "$HOME/.luarocks" --only-deps /itchio-dev-1.rockspec
