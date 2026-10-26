class DailydeckRunner < Formula
  desc "Supervised local task Runner for DailyDeck"
  homepage "https://www.dailydeck.ai"
  url "https://github.com/radkode/homebrew-dailydeck/releases/download/v0.2.31/dailydeck-runner-0.2.31-darwin-arm64-9c527412408f.tar.gz"
  version "0.2.31"
  sha256 "0b8218bba1d5b9ded9e9645f2f5464823531f1ba680a2fa49c891a3d7e560f20"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  skip_clean "bin/dailydeck-runner"

  def install
    bin.install "dailydeck-runner"
    pkgshare.install "manifest.json", "runner.entitlements", "NODE-LICENSE"
  end

  test do
    versions = JSON.parse(shell_output("#{bin}/dailydeck-runner --version"))
    assert_equal version.to_s, versions.fetch("runner")
    assert_equal 1, versions.fetch("host_protocol")
  end
end
