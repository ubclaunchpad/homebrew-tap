class Inertia < Formula
  desc "Simple, self-hosted continuous deployment"
  homepage "https://github.com/ubclaunchpad/inertia"
  bottle :unneeded

  # Stable
  version "0.6.1"
  url "https://github.com/ubclaunchpad/inertia/releases/download/v#{version}/inertia.v#{version}.darwin.amd64"
  sha256 "3bcd78d1c828020f9387862a5eacc952deaaa464e3cc8f336ef20324ee13941e"

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
      mv "inertia.v#{version}.darwin.amd64", "inertia"
      bin.install "inertia"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/inertia --version")
  end
end
