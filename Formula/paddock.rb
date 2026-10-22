class Paddock < Formula
  desc "Terminal workspace for running Claude Code"
  homepage "https://github.com/MiohitoKiri5474/paddock"
  url "https://github.com/MiohitoKiri5474/paddock/releases/download/v0.0.4/paddock-v0.0.4-aarch64-apple-darwin.tar.gz"
  version "0.0.4"
  sha256 "77c7d19d1264868d89ef7313df0193b535fb512feabb2c5c5fa0a7e16d521e6e"
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
