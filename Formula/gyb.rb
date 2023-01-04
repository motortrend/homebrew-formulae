# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://motortrendondemand.com/"
  url "hhttps://raw.githubusercontent.com/motortrend/homebrew-formulae/main/gyb/gyb"
  version "2023-01-03"
  sha256 "5965040b4c04528191d392d57282b1c5970fb8c3fedf1fb64bf6412173d6ac72"
  

  depends_on xcode: ["11.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/motortrend/homebrew-formulae/main/gyb/gyb.py"
    version "2023-01-03"
    sha256 "5965040b4c04528191d392d57282b1c5970fb8c3fedf1fb64bf6412173d6ac72"
  end
  depends_on "python@3" if MacOS.version <= :snow_leopard

  def install
    resource("gyb.py").stage { bin.install "gyb.py" }
    bin.install "gyb"
    chmod 0755, bin/"gyb"
  end

  test do
    system bin/"gyb", "--help"
  end
end
