cask "cc-gateway-pro" do
  version "3.19.1"
  sha256 "c0614d89eb22fadc540d320592af6b9ce018b74905e2150d652354461fc10714"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC.Gateway.Pro_3.19.1_aarch64.dmg"
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