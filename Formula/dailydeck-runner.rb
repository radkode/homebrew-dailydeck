class DailydeckRunner < Formula
  desc "Supervised local task Runner for DailyDeck"
  homepage "https://www.dailydeck.ai"
  url "https://github.com/radkode/homebrew-dailydeck/releases/download/v0.2.46/dailydeck-runner-0.2.46-darwin-arm64-3eb76d4e1d5b.tar.gz"
  version "0.2.46"
  sha256 "8cf930092a1afda905f29b30ddc7472128d3c402e3db3e642840b29829419388"

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
