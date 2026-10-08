#!/bin/zsh
# One-time: create the public GitHub repo xiyoushiguang/homebrew-tap from this directory and push.
# Needs gh logged in as a member of the xiyoushiguang org (checked 2026-10-08: qianqianob, admin, scope repo).
set -euo pipefail
cd "$(dirname "$0")"
export PATH="$HOME/.local/bin:$PATH"
gh repo create xiyoushiguang/homebrew-tap --public --source . --push \
  --description "Homebrew tap for Aureole (brew install --cask xiyoushiguang/tap/aureole)" \
  --homepage "https://github.com/xiyoushiguang/aureole"
echo "Done. Test on a Mac with Homebrew: brew install --cask xiyoushiguang/tap/aureole"
