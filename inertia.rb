class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "0.5.3"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.amd64"
  sha256 "8c516dd5ff8a7ac3ca67e13b867ab99a9225113480e9d3e01dc8c1b1d3539882"

  # Prerelease
  devel do
    version "0.5.3"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.amd64"
    sha256 "8c516dd5ff8a7ac3ca67e13b867ab99a9225113480e9d3e01dc8c1b1d3539882"
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
      mv "inertia.v#{version}.darwin.amd64", "inertia"
      bin.install "inertia"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
