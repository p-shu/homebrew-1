# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

# Edited
require "fileutils"

class WinPkg < Formula
  desc ""
  homepage ""
  url "http://wwweic.eri.u-tokyo.ac.jp/WIN/pub/win/WIN_pkg-3.0.6.tar.gz"
  sha256 "1bbf89bfa557370fc5804951de1bf0a412825050d0c861806d457805ec956e7f"

  # depends_on "cmake" => :build

  def install
    # Avoid "Empty installation" error which will be caused (Edited)
    FileUtils.mkdir_p("#{prefix}") unless File.exists?("#{prefix}")
    FileUtils.touch("#{prefix}/dummy")
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "export HOMEBREW_CC=gcc & export HOMEBREW_CXX=g++"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"
    system "make install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test WIN_pkg`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
