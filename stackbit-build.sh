#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e13ad43d1f80d001b77c7fc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e13ad43d1f80d001b77c7fc
curl -s -X POST https://api.stackbit.com/project/5e13ad43d1f80d001b77c7fc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e13ad43d1f80d001b77c7fc/webhook/build/publish > /dev/null
