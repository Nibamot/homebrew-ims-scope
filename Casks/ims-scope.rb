cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.0-6"
  sha256 arm:   "122dc7df139bd8d3acf4b852592a9d11b2fe893f77b2c0ad27457b7ce505c94a",
         intel: "9a13a085743758b38ad5d0ddf37bb1c37be18c53bc9ebc0ca3ad4e611552ceb8"

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
