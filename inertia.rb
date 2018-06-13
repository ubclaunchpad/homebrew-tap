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

  devel do
    version "0.4.0-rc2"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "0a20a1606699790e718a9a3de07b641972433aa302233a1194e3dc6ee9b55a63"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
