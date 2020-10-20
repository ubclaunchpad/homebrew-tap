class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "v0.7.0"
  sha256 "ab039b0a47981f2b2b104513ee3f68ae621e3332293e5622b256e2611add3e9e"
  url "https://github.com/ubclaunchpad/inertia/releases/download/#{version}/inertia.#{version}.darwin.amd64"

  # Build from latest commit
  head "https://github.com/ubclaunchpad/inertia.git"
  head do
    version "latest"
    depends_on "go" => :build
  end

  def install
    if build.head?
      system "go", "mod", "download"
      system "go", "build", "-o", "#{bin}/inertia"
    else
      mv "inertia.#{version}.darwin.amd64", "inertia"
      bin.install "inertia"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
