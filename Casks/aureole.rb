cask "aureole" do
  version "0.7.4"
  sha256 "967a637a33d9f62b4da7505fd076e301577261b3246d1a6e720a09596272ef5b"

  url "https://github.com/xiyoushiguang/aureole/releases/download/v#{version}/Aureole-#{version}.dmg"
  name "Aureole"
  desc "Notch bar showing Claude Code and Codex usage limits and live sessions"
  homepage "https://github.com/xiyoushiguang/aureole"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Aureole.app"

  uninstall quit: "app.aureole.Aureole"

  zap trash: [
    "~/Library/Application Support/Aureole",
    "~/Library/Preferences/app.aureole.Aureole.plist",
  ]

  caveats <<~EOS
    Before `brew uninstall`, remove the hooks and status line Aureole added:
    Aureole → Settings → General → Uninstall Aureole…, or Settings → Sessions → Remove hooks.
  EOS
end
