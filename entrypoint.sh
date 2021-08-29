#!/bin/bash

set -e

# cgroup v2: enable nesting (from https://github.com/moby/moby/blob/v20.10.8/hack/dind#L28-L38)
if [ -f /sys/fs/cgroup/cgroup.controllers ]
then
  echo -n "INFO: cgroups v2 detected; enabling nesting..."
  # move the processes from the root group to the /init group,
  # otherwise writing subtree_control fails with EBUSY.
  # An error during moving non-existent process (i.e., "cat") is ignored.
  mkdir -p /sys/fs/cgroup/init
  xargs -rn1 < /sys/fs/cgroup/cgroup.procs > /sys/fs/cgroup/init/cgroup.procs || :
  # enable controllers
  sed -e 's/ / +/g' -e 's/^/+/' < /sys/fs/cgroup/cgroup.controllers \
    > /sys/fs/cgroup/cgroup.subtree_control
  echo "done"
fi

echo "INFO: Executing: ${*}"
exec "${@}"
