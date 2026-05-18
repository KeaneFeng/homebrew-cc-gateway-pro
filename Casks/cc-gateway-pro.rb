cask "cc-gateway-pro" do
  version "0.1.0"
  sha256 "PLACEHOLDER_SHA256"

  url "https://github.com/KeaneFeng/cc-gateway-pro/releases/download/v#{version}/CC-Gateway-Pro_#{version}_aarch64.dmg"
  name "CC-Gateway-Pro"
  desc "AI Provider Gateway with Vision Routing & Project-Level Provider Binding (fork of cc-switch)"
  homepage "https://github.com/KeaneFeng/cc-gateway-pro"

  depends_on macos: ">= 12.0"

  app "CC-Gateway-Pro.app"

  zap trash: [
    "~/.cc-gateway-pro",
    "~/Library/Application Support/com.ccgatewaypro.desktop",
    "~/Library/Caches/com.ccgatewaypro.desktop",
    "~/Library/Preferences/com.ccgatewaypro.desktop.plist",
    "~/Library/WebKit/com.ccgatewaypro.desktop",
  ]

  caveats <<~EOS
    CC-Gateway-Pro is a desktop app for managing AI providers.

    Features:
      - Vision Model Auto-Routing (detect images → switch to vision model)
      - Project-Level Provider Binding (different projects → different providers)
      - Sync from cc-switch (import your existing providers)

    Launch from Applications or run:
      open -a "CC-Gateway-Pro"

    Config: ~/.cc-gateway-pro/
  EOS
end
