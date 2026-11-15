cask "macmuster" do
  version "1.1.1"
  sha256 "044e9423591fb276c69321f2e13fdb5b8491354c5cfe3d71ffffd2b49acb0235"

  url "https://github.com/gurupsv/MacMuster/releases/download/#{version}/MacMuster-#{version}.pkg"
  name "MacMuster"
  desc "Menu-bar application launcher and organizer"
  homepage "https://github.com/gurupsv/MacMuster"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  pkg "MacMuster-#{version}.pkg"

  uninstall quit:   "com.macmuster.app",
            delete: "/Applications/MacMuster.app"

  zap trash: [
    "~/Library/Caches/MacMuster",
    "~/Library/Preferences/com.macmuster.app.plist",
  ]
end
