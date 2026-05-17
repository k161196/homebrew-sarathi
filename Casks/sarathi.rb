cask "sarathi" do
  version "0.0.3"
  sha256 "3cbae7702f449b271d3ab8597bddec240937a8a7bfb20b8f4b491248b0593f57"

  url "https://github.com/k161196/homebrew-sarathi/releases/download/v#{version}/Sarathi-#{version}.zip"
  name "Sarathi"
  desc "Daily planner — time blocks, tasks, logs, brain dump"
  homepage "https://github.com/k161196/homebrew-sarathi"

  app "Sarathi.app"

  postflight do
    # Remove quarantine so Gatekeeper doesn't block unsigned app
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sarathi.app"],
                   sudo: false
  end

  uninstall quit: "com.kiran.Sarathi"
  zap trash: [
    "~/Library/Application Support/cloud.store",
    "~/Library/Application Support/local.store",
    "~/Library/Preferences/com.kiran.Sarathi.plist",
  ]
end
