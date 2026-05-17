cask "sarathi" do
  version "1.0.0"
  sha256 "REPLACE_WITH_SHA256_FROM_BUILD_SCRIPT"

  url "https://github.com/k161196/meops/releases/download/v#{version}/Sarathi-#{version}.zip"
  name "Sarathi"
  desc "Daily planner — time blocks, tasks, logs, brain dump"
  homepage "https://github.com/k161196/meops"

  app "Sarathi.app"

  postflight do
    # Remove quarantine so Gatekeeper doesn't block unsigned app
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Sarathi.app"],
                   sudo: false
  end

  uninstall quit: "com.kiran.Sarathi"
  zap trash: "~/Library/Application Support/cloud.store",
          "~/Library/Application Support/local.store",
          "~/Library/Preferences/com.kiran.Sarathi.plist"
end
