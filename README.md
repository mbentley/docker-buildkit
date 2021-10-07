# mbentley/buildkit

Docker image that extends the default buildkit images

## Tags

  * `v0.7.2` - maps to `moby/buildkit:v0.7.2`
  * `v0.9.1` - maps to `moby/buildkit:v0.9.1`

## Differences

  * Adds entrypoint script with support for cgroups v2
  * Updates runc to the [latest from Alpine edge](https://pkgs.alpinelinux.org/packages?name=runc&branch=edge&repo=community&arch=x86_64)
