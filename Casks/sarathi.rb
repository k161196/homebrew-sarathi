cask "sarathi" do
  version "0.0.4"
  sha256 "3f0190864295e6176a2c977c90db3f6708f4d439aea0a8d65641eebffadff8e2"

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
