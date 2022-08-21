# mbentley/buildkit

Docker image that extends the default buildkit images

## Tags

These tags are multi-arch enabled for `amd64`, `arm64`, and `armv7l`.  In addition, there are architecture specific tags in the form of `<version>-<architecture>`.

* `latest`, `v0.10`, `v0.10.3` - maps to `moby/buildkit:v0.10.3`
* `v0.10.2` - maps to `moby/buildkit:v0.10.2`
* `v0.10.1` - maps to `moby/buildkit:v0.10.1`
* `v0.10.0` - maps to `moby/buildkit:v0.10.0`

## Archived Tags

These tags are still available but are no longer updated:

* `v0.9`, `v0.9.2` - maps to `moby/buildkit:v0.9.2`
* `v0.9.1` - maps to `moby/buildkit:v0.9.1`
* `v0.7`, `v0.7.2` - maps to `moby/buildkit:v0.7.2`

## Differences

* Adds entrypoint script with support for cgroups v2 nesting
* Adds `pigz` for better multi-threaded compression/decompression
