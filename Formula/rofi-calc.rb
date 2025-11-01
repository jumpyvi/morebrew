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
    sha256 x86_64_linux: "010bee67584ef4580fa8bd00ffe2d344b5d6f295aa4f79648617a3711f956236"
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
