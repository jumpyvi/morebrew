class RofiCalc < Formula
  desc "Rofi calculator plugin"
  homepage "https://github.com/svenstaro/rofi-calc"
  version "2.5.0"
  url "https://github.com/svenstaro/rofi-calc/archive/refs/tags/v#{version}.tar.gz"
  sha256 "92cf4a1b2a42067d162cc7e87556644dab5db335cb3a65bc30e97467d7347b75"
  license "MIT"
  head "https://github.com/svenstaro/rofi-calc.git", branch: "master"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "bison" => :build
  depends_on "check" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "gcc" => :build
  depends_on "libqalculate"
  depends_on "rofi"
  depends_on :linux

  def install
    system "meson", "setup", "build", *std_meson_args
    system "meson", "compile", "-C", "build", "--verbose"

    (lib/"rofi").install "build/src/libcalc.so" => "calc.so"
  end

  test do
    assert_predicate lib/"rofi/calc.so", :exist?
  end
end
