cask "cc-gateway-pro" do
  version "3.16.10"
  sha256 "60cde7ed24871123b9843deb3a294f5bd8d5d4b15f0f393288eff84f45e35c4a"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC.Gateway.Pro_3.16.10_aarch64.dmg"
  name "CC Gateway Pro"
  desc "Multi-provider aggregation gateway for Claude Code"
  homepage "https://github.com/KeaneFeng/cc-gateway-pro"

  depends_on macos: :monterey

  app "CC Gateway Pro.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "/Applications/CC Gateway Pro.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.ccgatewaypro.desktop",
    "~/Library/Caches/com.ccgatewaypro.desktop",
    "~/Library/HTTPStorages/com.ccgatewaypro.desktop",
    "~/Library/Preferences/com.ccgatewaypro.desktop.plist",
    "~/Library/Saved Application State/com.ccgatewaypro.desktop.savedState",
    "~/Library/WebKit/com.ccgatewaypro.desktop",
  ]
end