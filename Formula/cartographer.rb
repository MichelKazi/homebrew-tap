class Cartographer < Formula
  desc "Keyboard-driven grid window tiler for macOS (like Tactile for GNOME)"
  homepage "https://github.com/MichelKazi/cartographer"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichelKazi/cartographer/releases/download/v0.0.1/cartographer"
      sha256 "fe790d61ca3e3e19ddfb001344f906e98e3e3c162631ea2496f9e10ddcb8aa41"
    end
  end

  def install
    bin.install "cartographer"
  end

  def caveats
    <<~EOS
      Cartographer needs Accessibility permission to work.
      It'll prompt you on first run, or you can grant it manually:
        System Settings > Privacy & Security > Accessibility

      Run it with: cartographer
      Quit it with: pkill cartographer
    EOS
  end

  test do
    assert_predicate bin/"cartographer", :executable?
  end
end
