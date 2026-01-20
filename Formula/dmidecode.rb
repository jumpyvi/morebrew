class Dmidecode < Formula
  desc "Reports information about your hardware as described in your system BIOS"
  homepage "https://www.nongnu.org/dmidecode/"
  url "https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.6.tar.xz"
  sha256 "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/jumpyvi/homebrew-morebrew/releases/download/dmidecode-3.6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "66cefad151cfea76ae39b88fa7b41f884e7634d3bbe98b7d628978296b886827"
  end

  def install
    system "make"
    system "make", "install", "prefix=#{prefix}", "sbindir=#{bin}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dmidecode --version")
  end
end
