class HistoryViewer < Formula
  desc "Powerful Go-based tool for analyzing zsh command history with AI-powered insights"
  homepage "https://github.com/geekychris/history_viewer"
  version "1.2.1"
  
  if Hardware::CPU.arm?
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.1/history_viewer-darwin-arm64.tar.gz"
    sha256 "cd6d4448a51976fe62a4db9bfd27d732503b6f72cfa7c356a86961b0a0d4d782"
  else
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.1/history_viewer-darwin-amd64.tar.gz"
    sha256 "b94e701565f3a1ae0831eb32c51919296ffd259612445c46e9498ca5fd38623f"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "history_viewer-darwin-arm64" => "history_viewer"
    else
      bin.install "history_viewer-darwin-amd64" => "history_viewer"
    end
  end

  test do
    assert_match "history_viewer", shell_output("#{bin}/history_viewer -h 2>&1", 0)
  end
end
