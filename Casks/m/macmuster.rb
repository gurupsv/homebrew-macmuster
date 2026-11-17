cask "macmuster" do
  version "1.1.2"
  sha256 "03a394c134d37c72f083518b789d9c70c5d5c790a859151c7d72b01d2a020945"

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
