class Paddock < Formula
  desc "Terminal workspace for running Claude Code"
  homepage "https://github.com/MiohitoKiri5474/paddock"
  url "https://github.com/MiohitoKiri5474/paddock/releases/download/v0.0.3/paddock-v0.0.3-aarch64-apple-darwin.tar.gz"
  version "0.0.3"
  sha256 "5c1703b0a8a132b71ece36e9ef6ccc37a25b1d484fbd3e5269a321e3a62bbe66"
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
  end
end
