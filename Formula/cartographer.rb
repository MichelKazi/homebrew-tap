class Cartographer < Formula
  desc "Keyboard-driven grid window tiler for macOS (like Tactile for GNOME)"
  homepage "https://github.com/MichelKazi/cartographer"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MichelKazi/cartographer/releases/download/v0.1.0/cartographer"
      sha256 "72e50707acda4c21d29c33a717c9e80c1f8faa2ec66acc082c9fa13303c434a3"
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
