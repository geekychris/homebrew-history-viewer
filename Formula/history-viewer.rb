class HistoryViewer < Formula
  desc "Powerful Go-based tool for analyzing zsh command history with AI-powered insights"
  homepage "https://github.com/geekychris/history_viewer"
  version "1.0.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/geekychris/history_viewer/releases/download/v1.0.0/history_viewer-darwin-arm64.tar.gz"
    sha256 "49503a61f47a3fcaaf270986408bc65645c7824cbcc6e48ac50f99476c35d8bc"
  else
    url "https://github.com/geekychris/history_viewer/releases/download/v1.0.0/history_viewer-darwin-amd64.tar.gz"
    sha256 "b576bcccdead3a52bddc547f126cb3ad66b173f7c20adf49df457b7c6d77a273"
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
