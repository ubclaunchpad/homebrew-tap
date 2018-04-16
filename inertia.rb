class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  version "0.2.0"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "b656483ba3058a38c04a9c398f911ce99dba2937e0352221c88597622b3013f8"
  bottle :unneeded

  def install
    mv "inertia.v#{version}.darwin.386", "inertia"
    bin.install "inertia"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
