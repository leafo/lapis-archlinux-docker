PHONY: install_deps build deploy

# this will update the lockfile to record all the dependencies, the lockfile will be uploaded to docker when building the image
install_deps:
	-rm -r .luarocks
	-rm -r lua_modules/
	luarocks --lua-version=5.1 init
	luarocks --lua-version=5.1 build --only-deps --pin

# we use no-cache here since we run pacman -Syu and we would like to always
# update the system to the latest before uploading the image, and not use the
# stall installation of packages 
build:
	docker build --no-cache -t ghcr.io/leafo/lapis-archlinux-itchio .

deploy:
	docker push ghcr.io/leafo/lapis-archlinux-itchio

