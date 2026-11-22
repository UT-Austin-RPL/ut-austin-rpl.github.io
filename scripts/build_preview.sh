#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."

ruby_version=$(cat .ruby-version)
if [[ "$(ruby -e 'print RUBY_VERSION')" != "$ruby_version" ]]; then
  echo "The preview requires Ruby $ruby_version (set RUBY_VERSION in Cloudflare Pages)." >&2
  exit 1
fi
bundler_version=$(awk '/^BUNDLED WITH$/{getline; print $1; exit}' Gemfile.lock)
if ! gem list --installed --exact bundler --version "$bundler_version" >/dev/null; then
  gem install bundler --version "$bundler_version" --no-document
fi

export BUNDLE_FROZEN=true
bundle "_$bundler_version"_ check || bundle "_$bundler_version"_ install --jobs 4 --retry 2
exec bundle "_$bundler_version"_ exec ruby scripts/build_preview.rb
