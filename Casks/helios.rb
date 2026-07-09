cask "helios" do
  version "1.18.0-beta.3"
  sha256 "b0446f4553a78ced4e4d38d3a89312c2ad9a557709635695dfb58b38beb93db0"

  url "https://github.com/MichelKazi/helios/releases/download/v#{version}/Helios-#{version}-arm64.zip"
  name "Helios"
  desc "Native remote workstation host — stream your desktop to any client, low latency"
  homepage "https://github.com/MichelKazi/helios"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Helios.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Helios.app"]
  end

  zap trash: [
    "~/.config/sunshine",
    "~/Library/Application Support/Helios",
    "~/Library/Preferences/dev.helios.Helios.plist",
  ]

  caveats <<~EOS
    Helios needs macOS permissions on first launch:
      • Screen Recording (desktop capture)
      • Accessibility + Input Monitoring (keyboard/mouse injection)
      • Microphone (host audio)

    Grant in System Settings → Privacy & Security → [category] → Helios,
    then RELAUNCH Helios (a running process won't pick up mid-run grants).

    Helios is self-signed (not Apple-notarized). The postflight strips the
    quarantine flag so it launches without a Gatekeeper block.
  EOS
end
