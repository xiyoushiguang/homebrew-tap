cask "aureole" do
  version "0.5.0"
  sha256 "64db01617de69a3640a2092c2c4a447bc6905eaaed150c973f9f14ecbfa80e8d"

  url "https://github.com/xiyoushiguang/aureole/releases/download/v#{version}/Aureole-#{version}.dmg"
  name "Aureole"
  desc "Notch bar showing Claude Code and Codex usage limits and live sessions"
  homepage "https://github.com/xiyoushiguang/aureole"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Aureole.app"

  uninstall quit: "app.aureole.Aureole"

  zap trash: [
    "~/Library/Application Support/Aureole",
    "~/Library/Preferences/app.aureole.Aureole.plist",
  ]

  caveats <<~EOS
    If you installed session hooks or the status line, remove them before
    uninstalling: Aureole → Settings → Sessions → Remove hooks.
  EOS
end
