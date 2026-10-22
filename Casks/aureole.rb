cask "aureole" do
  version "0.7.2"
  sha256 "63a3def0cce214fe2cc0df4e5577eef55a90406c8dfdd5733d5cc21d0beda9e3"

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
