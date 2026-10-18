cask "macmuster" do
  version "1.0.10"
  sha256 "c694c902585a6c0368427e81bd865e64e28fa3c34bb18c1d694d27a1be593e6d"

  url "https://github.com/gurupsv/MacMuster/releases/download/#{version}/MacMuster-#{version}.pkg"
  name "MacMuster"
  desc "Menu-bar application launcher and organizer for macOS"
  homepage "https://github.com/gurupsv/MacMuster"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  pkg "MacMuster-#{version}.pkg"

  uninstall quit:   "com.macmuster.app",
            delete: "/Applications/MacMuster.app"

  zap trash: [
    "~/Library/Preferences/com.macmuster.app.plist",
    "~/Library/Caches/MacMuster",
  ]
end
