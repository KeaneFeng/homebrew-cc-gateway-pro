cask "cc-gateway-pro" do
  version "3.6.0"
  sha256 "e36a789fc0f8a3818aec26070b7add8923b97f5e62f4ce89e4970a78fe6293d9"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC.Gateway.Pro_3.6.0_aarch64.dmg"
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