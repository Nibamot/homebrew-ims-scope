cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.0-3"
  sha256 arm:   "87e7ec39585967c471d7e17b707911fd2ce36df0008986fddecb6c31c9f9be90",
         intel: "619c60fdd264a29a3303ade5b2af267aca384f6fcdaac75511bb189ea09b53e6"

  url "https://github.com/Nibamot/freelens/releases/download/v#{version}/IMS-Scope-#{version}-macos-#{arch}.dmg"
  name "IMS-Scope"
  desc "Kubernetes IDE, fork of Freelens with a few incremental features"
  homepage "https://github.com/Nibamot/freelens"

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
