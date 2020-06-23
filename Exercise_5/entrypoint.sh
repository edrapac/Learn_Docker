#!/bin/bash

set -eou pipefail

useradd Fred -m -s /bin/bash

groupadd -g 1010 FredIsCool

usermod -a -G FredIsCool root

exec "$@"