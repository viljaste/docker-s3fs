#!/usr/bin/env bash

export FACTER_BUCKET="${BUCKET}"
export FACTER_AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}"
export FACTER_AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}"
export FACTER_MOUNT_POINT="${MOUNT_POINT}"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
