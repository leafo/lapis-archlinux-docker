# Lapis Docker Images

This repository provides a Docker image for developing and writing test suites in Lapis:

Contains Lapis, OpenResty, Postgres, SQLite, and MySQL.

The images are based off of Arch Linux base image, `archlinux`

## `lapis-archlinux`

### Versions

The following system packages are installed on the `latest` tag:

* openresty: 19.9.1 (Includes luajit)
* postgresql: 13.6
* redis: 6.2
* lua: 5.1
* luarocks: 3.8
* tup
* discount

The list of Lua modules pre-installed can be found in the [luarocks.lock file](luarocks.lock). The modules are installed as `--local` for the root user.

### Usage

```Dockerfile
FROM ghcr.io/leafo/lapis-archlinux-itchio:latest
```
