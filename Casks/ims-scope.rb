cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.4"
  sha256 arm:   "50a73e24f56d0767063b1bacf543d74162df48117ad795cc14a55bbe62104b39",
         intel: "0796a0763a14461d39028526a5f4cfeb737d6507177de65ffbc7cb899eefae02"

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
