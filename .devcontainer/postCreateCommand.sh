#!/usr/bin/env bash

# This post-create command script is designed for GitHub Codespaces that uses TakT
# It sets up git configuration, logs into GitHub CLI using a provided token,
# You should generate the GitHub OAuth token in a shell like this:
#
# $ gh auth login --web --hostname github.com --git-protocol https
#
# hereafter you can get the toke with:
#
# $ gh auth token
#
# Copy the token and got to https://github.com/settings/codespaces and store it as a secret named TAKT_GHO

set -e

PREFIX="🍰  "
echo "$PREFIX Running $(basename $0)"

set +e
gh auth status >/dev/null 2>&1
AUTH_OK=$?
set -e
if [ $AUTH_OK -ne 0 ]; then
  echo "$PREFIX ⚠️ Not logged into GitHub CLI"
  echo "$PREFIX    This is not going to work — we need GitHub CLI to work!"
  echo "$PREFIX ❌ FAILURE"
  exit 1
else
  echo "$PREFIX Installing the TakT gh cli extension from devx-cafe/gh-tt "
  gh extension install devx-cafe/gh-tt --pin experimental
  echo "$PREFIX Installing the gh shorthand aliases"    
  gh alias import .devcontainer/.gh_alias.yml --clobber
fi

echo "$PREFIX Setting up safe git repository to prevent dubious ownership errors"
git config --global --add safe.directory $(pwd)

echo "$PREFIX Setting up git configuration to support .gitconfig in repo-root"
git config --local --get include.path | grep -e ../.gitconfig >/dev/null 2>&1 || git config --local --add include.path ../.gitconfig

echo "$PREFIX Freeze Gemfile.lock so it isn't modified during install"
bundle config set frozen true         
echo "$PREFIX Installing the Ruby gems"
bundle install
bundle config set frozen false

echo "$PREFIX ✅ SUCCESS"
exit 0