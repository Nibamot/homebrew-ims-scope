cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.3"
  sha256 arm:   "500316b4ba207c844dda1f721e6b7169d1a6d40a41af70a9e15bcc200a3dbef3",
         intel: "066c05c5bf1aece8b361e9b5dac593d6b0abfc40603bb9a436481704ce635b3b"

  url "https://github.com/Nibamot/ims-scope/releases/download/v#{version}/IMS-Scope-#{version}-macos-#{arch}.dmg"
  name "IMS-Scope"
  desc "Kubernetes IDE, fork of Freelens with a few incremental features"
  homepage "https://github.com/Nibamot/ims-scope"

  auto_updates false

  app "IMS-Scope.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/IMS-Scope.app"]
  end

  zap trash: [
    "~/Library/Application Support/IMS-Scope",
    "~/Library/Caches/IMS-Scope",
    "~/Library/Logs/IMS-Scope",
    "~/Library/Preferences/app.freelens.Freelens.plist",
    "~/Library/Saved Application State/app.freelens.Freelens.savedState",
  ]
end
