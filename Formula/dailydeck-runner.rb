class DailydeckRunner < Formula
  desc "Supervised local task Runner for DailyDeck"
  homepage "https://www.dailydeck.ai"
  url "https://github.com/radkode/homebrew-dailydeck/releases/download/v0.2.64/dailydeck-runner-0.2.64-darwin-arm64-a5015a528af8.tar.gz"
  version "0.2.64"
  sha256 "c5816bac7af770ccdb5b1ec96dbf9c2b80bb904882b07fc4130dbdc9ab01dd31"

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
