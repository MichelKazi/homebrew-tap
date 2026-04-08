class Cartographer < Formula
  desc "Keyboard-driven grid window tiler for macOS (like Tactile for GNOME)"
  homepage "https://github.com/MichelKazi/cartographer"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichelKazi/cartographer/releases/download/v0.0.2/cartographer"
      sha256 "637d75ae1ee80bc0d6d0bd995fc063a8071464928619d817114e3f23d5ef8c5c"
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
