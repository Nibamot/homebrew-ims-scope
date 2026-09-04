cask "ims-scope" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.0"
  sha256 arm:   "b37fcecc507191c8ba810bfaf364c49ec01e5fe52950c6b90d1501f4cdcd5b4d",
         intel: "81d5e6bb41cdb88d66d36d12664da454929b84309d524863f463199c8944c878"

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
