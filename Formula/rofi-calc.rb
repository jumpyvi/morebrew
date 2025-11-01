class RofiCalc < Formula
  desc "Rofi calculator plugin"
  homepage "https://github.com/svenstaro/rofi-calc"
  url "https://github.com/svenstaro/rofi-calc/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "92cf4a1b2a42067d162cc7e87556644dab5db335cb3a65bc30e97467d7347b75"
  license "MIT"
  head "https://github.com/svenstaro/rofi-calc.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/jumpyvi/homebrew-morebrew/releases/download/rofi-calc-2.5.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f292e94316b218e899fb59434561a46db09b49ed25991db9a6ab92573d80538f"
  end

  # Build dependencies
  depends_on "bison" => :build
  depends_on "check" => :build
  depends_on "gcc" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build

  # Runtime dependencies
  depends_on "libqalculate"
  depends_on "rofi"

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"

    (lib/"rofi").install "build/src/libcalc.so" => "calc.so"
  end

  test do
    assert_path_exists lib/"rofi/calc.so"
  end
end
