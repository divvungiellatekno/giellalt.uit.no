#!/usr/bin/env bash
# Repo-specific step run by the shared docs workflow (giellalt/.github) after
# the Jekyll build, via its `postbuild_script` input. Jekyll's `keep_files:
# ["*-slidev"]` in _config.yml only protects these dirs from incremental-build
# cleanup — it doesn't copy them into a fresh _site, so do that explicitly.
set -euo pipefail

SITE_DIR="$GITHUB_WORKSPACE/_site"

echo "docs-postbuild: copying Slidev presentations into _site"
find . -type d -name "*-slidev" -not -path "./_site/*" -not -path "./node_modules/*" -not -path "./.git/*" | while read -r slidev_dir; do
  if [ -f "$slidev_dir/index.html" ]; then
    target_dir="$SITE_DIR/$slidev_dir"
    mkdir -p "$(dirname "$target_dir")"
    cp -r "$slidev_dir" "$(dirname "$target_dir")/"
    echo "Copied $slidev_dir to $target_dir"
  fi
done

echo "docs-postbuild: verifying"
find "$SITE_DIR" -type d -name "*-slidev" | while read -r dir; do
  if [ -f "$dir/index.html" ]; then
    echo "✓ Found $dir/index.html"
  else
    echo "✗ Missing index.html in $dir"
  fi
done
