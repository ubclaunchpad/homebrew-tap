class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "0.4.4"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "12d967a0378924e48062457acc812c2741b634b9ec3a2724c7340ea285986c16"

  # Prerelease
  devel do
    version "0.4.4"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "12d967a0378924e48062457acc812c2741b634b9ec3a2724c7340ea285986c16"
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
