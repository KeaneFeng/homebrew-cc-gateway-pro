cask "cc-gateway-pro" do
  version "3.20.1"
  sha256 "5191f54de91646f5c4261f8e472c318fd048fffdf79cb60dfe3bf5bd41b6d8ad"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC Gateway Pro_3.15.2_aarch64.dmg"
  name "CC-Gateway-Pro"
  desc "Multi-provider aggregation gateway for Claude Code"
  homepage "https://github.com/KeaneFeng/cc-gateway-pro"

  depends_on macos: :monterey

  app "CC-Gateway-Pro.app"

  postflight do
    # Remove quarantine attribute for ad-hoc signed builds
    # Gatekeeper shows "app is damaged" for quarantined unsigned apps
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "/Applications/CC-Gateway-Pro.app"]
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
