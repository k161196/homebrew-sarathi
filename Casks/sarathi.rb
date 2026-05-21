cask "sarathi" do
  version "0.0.9"
  sha256 "62e4ebb744c298d26f5dc65101af72727fb7bb7c010b98ab2c2a22b8c538f550"

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
