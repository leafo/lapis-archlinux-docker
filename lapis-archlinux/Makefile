PHONY: build deploy

# --no-cache will only prevent that intermediate layers aren't written to the
#  cache for subsequent builds. You will still need to manually update docker
#  pull archlinux:latest before building image
build:
	docker build --no-cache -t ghcr.io/leafo/lapis-archlinux .

deploy:
	docker push ghcr.io/leafo/lapis-archlinux

