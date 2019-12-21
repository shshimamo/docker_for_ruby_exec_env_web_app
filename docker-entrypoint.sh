#!/bin/bash

set -eu

# 必要であればBundlerでgemをインストールする
bundle check || bundle install

exec "$@"
