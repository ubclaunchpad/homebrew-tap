class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  version "0.3.0"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "6acff87b76e1ec38c2c9f89f77d196e15fcc5bab1b0230e9b2905b27bbb0b20f"
  bottle :unneeded

  def install
    mv "inertia.v#{version}.darwin.386", "inertia"
    bin.install "inertia"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
