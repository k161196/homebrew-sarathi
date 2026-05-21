cask "sarathi" do
  version "0.0.10"
  sha256 "9efb5bb09bc21a050c406d7b984f8b7cb802d420951d205287906e5a02b09f5e"

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
