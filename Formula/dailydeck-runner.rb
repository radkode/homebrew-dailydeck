class DailydeckRunner < Formula
  desc "Supervised local task Runner for DailyDeck"
  homepage "https://www.dailydeck.ai"
  url "https://github.com/radkode/homebrew-dailydeck/releases/download/v0.2.30/dailydeck-runner-0.2.30-darwin-arm64-00c74b98bc3c.tar.gz"
  version "0.2.30"
  sha256 "4e4fc140f65da4d40acf358fb0d7009b111492c6590c4284a1ea4cd1c0b0994e"

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
