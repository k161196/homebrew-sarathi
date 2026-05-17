cask "sarathi" do
  version "0.0.2"
  sha256 "3d31539bfda632a6e017f2d7ffc1bfea33f092cf51adaf2eca2ee9e87cc1b66b"

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
  zap trash: [
    "~/Library/Application Support/cloud.store",
    "~/Library/Application Support/local.store",
    "~/Library/Preferences/com.kiran.Sarathi.plist",
  ]
end
