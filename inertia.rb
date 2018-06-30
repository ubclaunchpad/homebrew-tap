class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  version "0.4.0"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "b924b123eb852969489572b46404e416728e78519ca3c6025f0441124a2e7024"
  bottle :unneeded

  def install
    mv "inertia.v#{version}.darwin.386", "inertia"
    bin.install "inertia"
  end

  devel do
    version "0.4.0"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "b924b123eb852969489572b46404e416728e78519ca3c6025f0441124a2e7024"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
