class Dmidecode < Formula
  desc "Dmidecode reports information about your system's hardware as described in your system BIOS according to the SMBIOS/DMI standard"
  homepage "https://www.nongnu.org/dmidecode/"
  url "https://download.savannah.gnu.org/releases/dmidecode/dmidecode-3.6.tar.xz"
  sha256 "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://download.savannah.gnu.org/releases/dmidecode/"
    regex(/href=.*?dmidecode[._-]v?(\d+(?:\.\d+)+)\.tar\.xz/i)
  end

  bottle do
    root_url "https://github.com/jumpyvi/homebrew-morebrew/releases/download/dmidecode-3.6"
    sha256 x86_64_linux: "7e2d48f71c766d443d6f711e5df559211d4f8a472a3a9872e42e3131e7d04c80"
  end

  def install
    system "make"
    system "make", "install", "prefix=#{prefix}", "sbindir=#{bin}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dmidecode --version")
  end
end