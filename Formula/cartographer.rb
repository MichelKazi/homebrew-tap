class Cartographer < Formula
  desc "Keyboard-driven grid window tiler for macOS (like Tactile for GNOME)"
  homepage "https://github.com/MichelKazi/cartographer"
  version "0.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichelKazi/cartographer/releases/download/v0.0.3/cartographer"
      sha256 "8512d4a22ca3e41a838ca34d8df189f339bd796966d9d9e486221339b0a55927"
    end
  end

  def install
    bin.install "cartographer"
  end

  service do
    run opt_bin/"cartographer"
    keep_alive false
    log_path var/"log/cartographer.log"
    error_log_path var/"log/cartographer.log"
  end

  def caveats
    <<~EOS
      Cartographer needs Accessibility permission to work.
      It'll prompt you on first run, or you can grant it manually:
        System Settings > Privacy & Security > Accessibility

      To start as a background service (and launch at login):
        brew services start cartographer

      To stop:
        brew services stop cartographer

      Or just run it directly: cartographer
      Quit via the menu bar icon or: pkill cartographer
    EOS
  end

  test do
    assert_predicate bin/"cartographer", :executable?
  end
end
