# typed: false
# frozen_string_literal: true

# :nodoc:
class Gyb < Formula
  desc "\"Generate Your Boilerplate\""
  homepage "https://motortrendondemand.com/"
  url "https://raw.githubusercontent.com/motortrend/homebrew-formulae/main/gyb/gyb?token=GHSAT0AAAAAAB5AYHPL5S4E7G2SHANSIUTKY5UYQBA"
  version "2023-01-03"

  depends_on xcode: ["11.0", :build]

  resource "gyb.py" do
    url "https://raw.githubusercontent.com/motortrend/homebrew-formulae/main/gyb/gyb.py?token=GHSAT0AAAAAAB5AYHPKJKFVUINMGWFVE7GWY5UYSHA"
    version "2023-01-03"
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
