cask "aureole" do
  version "0.4.0"
  sha256 "f48c6f96786ea9dd60b583fb734756ee3ffc762e623d5ad482d5bb1add383781"

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
