# mbentley/buildkit

Docker image that extends the default buildkit images

## Tags

  * `v0.7.2` - maps to `moby/buildkit:v0.7.2`

## Differences

  * Adds entrypoint script with support for cgroups v2
  * Updates runc to the [latest from Alpine 3.14](https://pkgs.alpinelinux.org/packages?name=runc&branch=v3.14&repo=community&arch=x86_64)
