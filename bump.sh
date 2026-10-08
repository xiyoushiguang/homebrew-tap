#!/bin/zsh
# Update Casks/aureole.rb to a published Aureole release: ./bump.sh <version>
# Reads the sha256 the release itself publishes (Aureole-<v>.dmg.sha256), so no local build is needed.
set -euo pipefail
cd "$(dirname "$0")"
v="${1:?usage: ./bump.sh <version, e.g. 0.5.0>}"
url="https://github.com/xiyoushiguang/aureole/releases/download/v${v}/Aureole-${v}.dmg.sha256"
sha="$(curl -fsSL "$url" | awk '{print $1}')"
if [[ ${#sha} -ne 64 ]]; then echo "could not read a sha256 from $url" >&2; exit 1; fi
sed -i '' -e "s/^  version \".*\"/  version \"${v}\"/" -e "s/^  sha256 \".*\"/  sha256 \"${sha}\"/" Casks/aureole.rb
ruby -c Casks/aureole.rb >/dev/null
git add Casks/aureole.rb
git commit -m "aureole ${v}"
echo "Casks/aureole.rb now points at v${v} (${sha}). Next: git push"
