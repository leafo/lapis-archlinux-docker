FROM finalduty/archlinux:latest
MAINTAINER leaf corcoran <leafot@gmail.com>

RUN pacman -S base-devel luajit postgresql postgresql-libs luarocks5.1 redis geoip tup git npm sassc pygmentize --noconfirm && \
	yes | pacman -Scc && \
	npm install -g coffee-script && \
	npm install -g uglify-js && \
	(cd /tmp && sudo -u nobody git clone https://aur.archlinux.org/discount.git/ && cd discount && sudo -u nobody makepkg && pacman -U *.tar.xz --noconfirm)

# setup openresty
RUN curl -O https://openresty.org/download/openresty-1.11.2.1.tar.gz && \
	tar xvfz openresty-1.11.2.1.tar.gz && \
	(cd openresty-1.11.2.1 && ./configure --with-pcre-jit --with-http_geoip_module && make && make install) && \
	rm -rf openresty-1.11.2.1 && rm openresty-1.11.2.1.tar.gz

# setup postgresql
RUN su postgres -c "initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'" && mkdir /run/postgresql && chown postgres:postgres /run/postgresql

# install lua dependencies
COPY deps /deps
RUN cat /deps | sed 's/#.*//g' | while read dep; do luarocks-5.1 install "$dep"; done