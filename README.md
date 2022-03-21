

# Lapis Docker Images

This repository provides two Docker images for developing and writing test suites in Lapis:

* [`lapis-archlinux`](https://github.com/users/leafo/packages/container/package/lapis-archlinux-itchio) &mdash; Contains Lapis, OpenResty, Postgres, and MySQL. Used for the [Lapis test suite](https://github.com/leafo/lapis/blob/master/Dockerfile)
* [`lapis-archlinux-itchio`](https://github.com/users/leafo/packages/container/package/lapis-archlinux) &mdash; Contains Lapis, OpenResty, Postgres, and set of dependencies often used by web projects I've built, and a base set of Lua modules preinstalled described below.

The images are based off of Arch Linux base image, `archlinux`

## `lapis-archlinux`

### Versions

These are the versions of things included in the `latest` tag:

* openresty: 19.3.1 (Includes luajit)
* postgresql: 13.1
* mariadb: 10.5.8
* redis: 6.0.9
* lua: 5.1, 5.2, 5.3, 5.4
* luarocks: 3.4.0

### Usage

```Dockerfile
FROM ghcr.io/leafo/lapis-archlinux:latest
```

## `lapis-archlinux-itchio`

### Versions

The following system packages are installed on the `latest` tag:

* openresty: 19.9.1 (Includes luajit)
* postgresql: 13.6
* redis: 6.0
* lua: 5.1
* luarocks: 3.8
* npm &mdash; With coffeescript@1.12.7 and uglify-js installed globally
* sassc
* tup
* libmaxminddb 
* discount

The list of Lua modules pre-installed can be found in the [luarocks.lock file](https://github.com/leafo/lapis-archlinux-docker/blob/master/lapis-archlinux-itchio/luarocks.lock). The modules are installed as `--local` for the root user.

### Usage

```Dockerfile
FROM ghcr.io/leafo/lapis-archlinux-itchio:latest
```
