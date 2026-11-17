cask "aureole" do
  version "0.7.3"
  sha256 "e7e45503e6cfa1cb3ab3e9496926d6a8e051b5b8d451dfc85c5b65c4a74cc097"

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
