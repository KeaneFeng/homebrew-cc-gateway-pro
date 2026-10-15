cask "cc-gateway-pro" do
  version "4.0.14"
  sha256 "8e1de106f9c150ed4fc4ec466d59a8553973065313ece39ba5e65c87e61d2961"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC.Gateway.Pro_4.0.14_aarch64.dmg"
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