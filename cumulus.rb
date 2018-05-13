class Cumulus < Formula
    desc "Simple, self-hosted continuous deployment"
    homepage "https://github.com/ubclaunchpad/cumulus"
    version "1.0.0"
    url "https://github.com/ubclaunchpad/cumulus/releases/download/#{version}/cumulus.#{version}.darwin.386"
    sha256 "26435171eaa267b68e3d601c8d042f508c403eb7522e76e49de7522f3d44b76f"
    bottle :unneeded

    def install
        mv "cumulus.#{version}.darwin.386", "cumulus"
        bin.install "cumulus"
    end
end
