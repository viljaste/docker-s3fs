#!/usr/bin/env bash

export FACTER_BUCKET="${BUCKET}"

puppet apply --modulepath=/src/run/modules /src/run/run.pp

/usr/bin/supervisord
