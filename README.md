# mbentley/buildkit

Docker image that extends the default buildkit images

## Tags

* `latest`, `v0.10`, `v0.10.3` - maps to `moby/buildkit:v0.10.3`
* `v0.10.2` - maps to `moby/buildkit:v0.10.2`
* `v0.10.1` - maps to `moby/buildkit:v0.10.1`
* `v0.10.0` - maps to `moby/buildkit:v0.10.0`
* `v0.9`, `v0.9.2` - maps to `moby/buildkit:v0.9.2`
* `v0.9.1` - maps to `moby/buildkit:v0.9.1`
* `v0.7`, `v0.7.2` - maps to `moby/buildkit:v0.7.2`

## Differences

* Adds entrypoint script with support for cgroups v2 nesting
* Adds `pigz` for better multi-threaded compression/decompression
