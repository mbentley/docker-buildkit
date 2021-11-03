# mbentley/buildkit

Docker image that extends the default buildkit images

## Tags

* `latest`, `v0.9.2` - maps to `moby/buildkit:v0.9.2`
* `v0.9.1` - maps to `moby/buildkit:v0.9.1`
* `v0.7.2` - maps to `moby/buildkit:v0.7.2`

## Differences

* Adds entrypoint script with support for cgroups v2
* Updates `runc` to the [latest from Alpine edge](https://pkgs.alpinelinux.org/packages?name=runc&branch=edge&repo=community&arch=x86_64)
* Adds `pigz` for better multi-threaded compression/decompression
