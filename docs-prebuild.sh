#!/usr/bin/env bash
# Repo-specific prep run by the shared docs workflow (giellalt/.github) before
# the Jekyll build, via its `prebuild_script` input. Ruby/bundler are already
# set up; Node ships on the runner image already (the shared workflow itself
# uses it for Pagefind), so no separate setup step is needed here.
set -euo pipefail

echo "docs-prebuild: building Slidev presentations"
npm install -g @slidev/cli @slidev/theme-default @slidev/theme-seriph playwright-chromium
chmod +x build-slidev.sh
CI=true NODE_ENV=production ./build-slidev.sh
