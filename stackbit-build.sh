#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df45c5ad813d10014097989/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df45c5ad813d10014097989
curl -s -X POST https://api.stackbit.com/project/5df45c5ad813d10014097989/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5df45c5ad813d10014097989/webhook/build/publish > /dev/null
