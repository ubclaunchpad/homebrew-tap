class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "0.4.2"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
  sha256 "d8742d9aa1c83f0b7ac352f86e675ad25de9826f19f531e99834f6e66ae8b563"

  # Prerelease
  devel do
    version "0.4.2"
    url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.386"
    sha256 "d8742d9aa1c83f0b7ac352f86e675ad25de9826f19f531e99834f6e66ae8b563"
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
