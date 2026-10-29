class Paddock < Formula
  desc "Terminal workspace for running Claude Code"
  homepage "https://github.com/MiohitoKiri5474/paddock"
  url "https://github.com/MiohitoKiri5474/paddock/releases/download/v0.1.0-rc.2/paddock-v0.1.0-rc.2-aarch64-apple-darwin.tar.gz"
  version "0.1.0-rc.2"
  sha256 "c10b9032a07688b7d79581a71c00c4715bc7bc850534bd427b72b5cf8187cb38"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "paddock"
  end

  def caveats
    <<~EOS
      To let paddock track Claude Code sessions, install its hooks:
        paddock hooks install
    EOS
  end

  test do
    assert_match "[keys]", shell_output("#{bin}/paddock keys")
    assert_equal "paddock #{version}\n", shell_output("#{bin}/paddock --version")
  end
end
