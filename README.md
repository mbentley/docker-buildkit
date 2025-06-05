# mbentley/buildkit

Docker image that extends the default buildkit images

Versions prior to v0.20 were still built by me, extending the original moby/buildkit images. Starting with v0.20 and beyond, there is no need to extend the image as the cgroup management is handled within buildkit.

The challenge still exists that there are no `major.minor` tagged images for buildkit so that's what this repository is continuing to provide.

## Tags

Using [buildkit_tag_manifests.sh](./buildkit_tag_manifests.sh), I am just re-writing the manifests from the upstream moby/buildkit repo so that there are major.minor tags in additional to the major.minor.bugfix tags. For example, if `v0.22.3` is the latest version, a `v0.22` tag is created to maps to `v0.22.3` and then a `v0.22.4` comes out, it's manifest will be written to the `v0.22` tag.

There is no `latest` tags of any sort in this repo and that's done on purpose.

## Archived Tags

These tags are multi-arch enabled for `amd64` and `arm64`. In addition, there are architecture specific tags in the form of `<version>-<architecture>`. These tags are still available but are no longer updated:

### `v0.19.x`

* `v0.19`, `v0.19.0` - maps to `moby/buildkit:v0.19.0`

### `v0.18.x`

* `v0.18`, `v0.18.2` - maps to `moby/buildkit:v0.18.2`
* `v0.18.1` - maps to `moby/buildkit:v0.18.1`
* `v0.18.0` - maps to `moby/buildkit:v0.18.0`

### `v0.17.x`

* `v0.17`, `v0.17.0` - maps to `moby/buildkit:v0.17.0`

### `v0.16.x`

* `v0.16`, `v0.16.0` - maps to `moby/buildkit:v0.16.0`

### `v0.15.x`

* `v0.15`, `v0.15.2` - maps to `moby/buildkit:v0.15.2`
* `v0.15.1` - maps to `moby/buildkit:v0.15.1`
* `v0.15.0` - maps to `moby/buildkit:v0.15.0`

### `v0.14.x`

* `v0.14`, `v0.14.1` - maps to `moby/buildkit:v0.14.1`
* `v0.14.0` - maps to `moby/buildkit:v0.14.0`

### `v0.13.x`

* `v0.13`, `v0.13.2` - maps to `moby/buildkit:v0.13.2`
* `v0.13.1` - maps to `moby/buildkit:v0.13.1`
* `v0.13.0` - maps to `moby/buildkit:v0.13.0`

### `v0.12.x`

* `v0.12`, `v0.12.5` - maps to `moby/buildkit:v0.12.5`
* `v0.12.4` - maps to `moby/buildkit:v0.12.4`
* `v0.12.3` - maps to `moby/buildkit:v0.12.3`
* `v0.12.2` - maps to `moby/buildkit:v0.12.2`
* `v0.12.1` - maps to `moby/buildkit:v0.12.1`
* `v0.12.0` - maps to `moby/buildkit:v0.12.0`

### `v0.11.x`

* `v0.11.6` - maps to `moby/buildkit:v0.11.6`
* `v0.11.5` - maps to `moby/buildkit:v0.11.5`
* `v0.11.4` - maps to `moby/buildkit:v0.11.4`
* `v0.11.3` - maps to `moby/buildkit:v0.11.3`
* `v0.11.2` - maps to `moby/buildkit:v0.11.2`
* `v0.11.1` - maps to `moby/buildkit:v0.11.1`
* `v0.11.0` - maps to `moby/buildkit:v0.11.0`

### `v0.10.x`

* `v0.10.6` - maps to `moby/buildkit:v0.10.6`
* `v0.10.5` - maps to `moby/buildkit:v0.10.5`
* `v0.10.4` - maps to `moby/buildkit:v0.10.4`
* `v0.10.3` - maps to `moby/buildkit:v0.10.3`
* `v0.10.2` - maps to `moby/buildkit:v0.10.2`
* `v0.10.1` - maps to `moby/buildkit:v0.10.1`
* `v0.10.0` - maps to `moby/buildkit:v0.10.0`

### `v0.9.x`

* `v0.9`, `v0.9.2` - maps to `moby/buildkit:v0.9.2`
* `v0.9.1` - maps to `moby/buildkit:v0.9.1`

### `v0.7.x`

* `v0.7`, `v0.7.2` - maps to `moby/buildkit:v0.7.2`

### `master`

* `master` - maps to `moby/buildkit:master`

## Differences

* Adds entrypoint script with support for cgroups v2 nesting
