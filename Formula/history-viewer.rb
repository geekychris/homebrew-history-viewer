class HistoryViewer < Formula
  desc "Powerful Go-based tool for analyzing zsh command history with AI-powered insights"
  homepage "https://github.com/geekychris/history_viewer"
  version "1.2.4"
  
  if Hardware::CPU.arm?
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.4/history_viewer-darwin-arm64.tar.gz"
    sha256 "bc1bfbb3aeb0f12372eb5c8ba824eb75733d41e30446e47cb61846ebda653c6f"
  else
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.4/history_viewer-darwin-amd64.tar.gz"
    sha256 "ee96ac7af98259db6f79d05482eb7fbe326b621b53dfca544ac2db355508c316"
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
