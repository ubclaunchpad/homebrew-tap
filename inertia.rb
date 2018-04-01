class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  version "0.1.1"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "a687116c7fe155ed2150f86843f933c506eeb5335547e79e4786dec2ae16fc6b"
  bottle :unneeded

  def install
    mv "inertia.v#{version}.darwin.386", "inertia"
    bin.install "inertia"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
