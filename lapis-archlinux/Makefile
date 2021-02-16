PHONY: build deploy

# no cache to ensure we pull latest from pacman -Syu
build:
	docker build --no-cache -t ghcr.io/leafo/lapis-archlinux .

deploy:
	docker push ghcr.io/leafo/lapis-archlinux

