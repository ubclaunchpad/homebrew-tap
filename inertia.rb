class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "0.4.0"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "b924b123eb852969489572b46404e416728e78519ca3c6025f0441124a2e7024"

  # Prerelease
  devel do
    version "0.4.0"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "b924b123eb852969489572b46404e416728e78519ca3c6025f0441124a2e7024"
  end

  # Build from latest commit
  head "https://github.com/ubclaunchpad/inertia.git"
  head do
    version "latest"
    depends_on "dep"
    depends_on "go" => :build
  end

  def install
    if build.head?
      ENV["GOPATH"] = buildpath
      path = buildpath/"src/github.com/ubclaunchpad/inertia"
      system "go", "get", "-u", "github.com/ubclaunchpad/inertia"
      cd path do
        system "dep", "ensure"
        system "go", "build", "-o", "#{bin}/inertia"
      end
    else
      mv "inertia.v#{version}.darwin.386", "inertia"
      bin.install "inertia"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
