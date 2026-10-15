cask "aureole" do
  version "0.6.0"
  sha256 "92f3e6923c46186ebf2960c1bd521508c45744b0e7c1b69d9d93ef5f07fe3163"

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
