
### Updating

1. Update `Dockerfile` with new dependencies
2. Build the image `docker build --no-cache -t ghcr.io/leafo/lapis-archlinux .`
3. Push `docker push ghcr.io/leafo/lapis-archlinux`
4. Tag the latest version with the current date, eg. `2021-2-16` and push that tag

