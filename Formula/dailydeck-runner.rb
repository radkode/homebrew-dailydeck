class DailydeckRunner < Formula
  desc "Supervised local task Runner for DailyDeck"
  homepage "https://www.dailydeck.ai"
  url "https://github.com/radkode/homebrew-dailydeck/releases/download/v0.2.51/dailydeck-runner-0.2.51-darwin-arm64-03b47a8e1da6.tar.gz"
  version "0.2.51"
  sha256 "1ca6b586b4d67cfac748066e6e735948514356306ccc3a5c3144becb18006b47"

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
