# homebrew-tap

Homebrew tap for [Aureole](https://github.com/xiyoushiguang/aureole), a notch bar for Claude Code and Codex usage and sessions.

```bash
brew install --cask xiyoushiguang/tap/aureole
```

Requires an Apple silicon Mac running macOS 14 (Sonoma) or newer. The app is signed with a Developer ID and notarized, so it opens without any Gatekeeper prompt.

## Maintainers

Each Aureole release ships `Aureole-<version>.dmg` and a matching `.sha256` on the Releases page. To publish a new version to the tap:

```bash
./bump.sh 0.5.0   # rewrites version + sha256 in Casks/aureole.rb and commits
git push
```
