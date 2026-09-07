cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.1"
  sha256 arm:   "281483ffdbaeb46b25952d291bc98bfd86c1908131aa4701bc2fd03d41db9c99",
         intel: "b6322b608f04e42e1fbab0cd96f7c7944f750a2844c90f431628fd4b16c982b7"

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
