

# Lapis Docker Images

This repository provides two Docker images for developing and writing test suites in Lapis:

* [lapis-archlinux](https://github.com/users/leafo/packages/container/package/lapis-archlinux-itchio) &mdash; Contains Lapis, OpenResty, Postgres, and MySQL. Used for the [Lapis test suite](https://github.com/leafo/lapis/blob/master/Dockerfile)
* [lapis-archlinux-itchio](https://github.com/users/leafo/packages/container/package/lapis-archlinux) &mdash; Contains Lapis, OpenResty, Postgres, and set of dependencies often used by web projects I've built. (itchio being the prototype example, but there is nothing itchio specific here) (Located in the itchio branch of this repository)

The images are based off of Arch Linux

## Versions

These are the versions of things included in the `latest` tag:

* openresty: 19.3.1
* postgresql: 13.1
* mariadb: 10.5.8
* redis: 6.0.9
* luarocks: 3.4.0

## Usage

```Dockerfile
FROM ghcr.io/leafo/lapis-archlinux:latest
```
Or


```Dockerfile
FROM ghcr.io/leafo/lapis-archlinux-itchio:latest
```