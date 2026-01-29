class HistoryViewer < Formula
  desc "Powerful Go-based tool for analyzing zsh command history with AI-powered insights"
  homepage "https://github.com/geekychris/history_viewer"
  version "1.2.3"
  
  if Hardware::CPU.arm?
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.3/history_viewer-darwin-arm64.tar.gz"
    sha256 "c6ddccf8e0effce46c1737fb12fa28a098968ad7d214b627d609f1f5be913843"
  else
    url "https://github.com/geekychris/history_viewer/releases/download/v1.2.3/history_viewer-darwin-amd64.tar.gz"
    sha256 "d9f2c1c0c1d0ec33c82e5bb6c10902903244407bdeb5a30c8baf17ff38ea4982"
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
