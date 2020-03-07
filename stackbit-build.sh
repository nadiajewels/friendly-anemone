#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e63657214b69200127309ca/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e63657214b69200127309ca
curl -s -X POST https://api.stackbit.com/project/5e63657214b69200127309ca/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5e63657214b69200127309ca/webhook/build/publish > /dev/null
