cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.0-5"
  sha256 arm:   "e843cb579fa932b4cb7708669091003b4614055afe7cef2af8b799528d561dbb",
         intel: "96729f77ed43c830a67cee1b2ffe44c1a2aadfd4e44e4eb2cec6d8a1a67f87a6"

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
