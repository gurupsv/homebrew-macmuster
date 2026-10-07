cask "macmuster" do
  version "1.0.2"
  # PLACEHOLDER — replace with the sha256 of the published MacMuster-1.0.2.pkg
  # before the first install. Compute it after the first release is published:
  #   curl -L -o /tmp/MacMuster.pkg \
  #     "https://github.com/gurupsv/MacMuster/releases/download/1.0.2/MacMuster-1.0.2.pkg"
  #   shasum -a 256 /tmp/MacMuster.pkg
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

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
