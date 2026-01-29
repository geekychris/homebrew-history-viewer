class HistoryViewer < Formula
  desc "Powerful Go-based tool for analyzing zsh command history with AI-powered insights"
  homepage "https://github.com/geekychris/history_viewer"
  version "1.2.4"
  
  if Hardware::CPU.arm?
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.4/history_viewer-darwin-arm64.tar.gz"
    sha256 "8144b730971c5b340f450778b717d725e96e71ad7012519a11cf2626dc557d94"
  else
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.4/history_viewer-darwin-amd64.tar.gz"
    sha256 "f283b9c38db211dd1fea55cf4fcfa8abb983e1028e87c98ee86d781dddfe1776"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "history_viewer-darwin-arm64" => "history_viewer"
    else
      bin.install "history_viewer-darwin-amd64" => "history_viewer"
    end
  end

  test do
    assert_match "history_viewer", shell_output("#{bin}/history_viewer -h")
  end
end
