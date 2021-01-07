FROM archlinux/base:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -Sy base-devel lua51 postgresql postgresql-libs luarocks redis geoip tup git npm sassc pygmentize --noconfirm && \
	(yes | pacman -Scc || :) && \
	npm install -g coffeescript@1.12.7 && \
	npm install -g uglify-js && \
	(cd /tmp && sudo -u nobody git clone https://aur.archlinux.org/discount.git/ && cd discount && sudo -u nobody makepkg && pacman -U *.tar.zst --noconfirm)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.19.3.1.tar.gz && \
	tar xvfz openresty-1.19.3.1.tar.gz && \
	(cd openresty-1.19.3.1 && \
		./configure --with-pcre-jit --with-http_geoip_module --with-cc-opt="-I/usr/include/openssl-1.0" --with-ld-opt="-L/usr/lib/openssl-1.0" && \
		make && make install) && \
	rm -rf openresty-1.19.3.1 && rm openresty-1.19.3.1.tar.gz

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# install lua dependencies
COPY deps /deps
RUN cat /deps | sed 's/#.*//g' | while read dep; do luarocks --lua-version=5.1 install --local "$dep"; done