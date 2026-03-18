class GitcodeCli < Formula
  include Language::Python::Virtualenv

  desc "GitHub CLI-style command line interface for GitCode"
  homepage "https://github.com/AndyKong2020/gitcode-cli"
  url "https://github.com/AndyKong2020/gitcode-cli/releases/download/v0.1.0/gitcode_cli-0.1.0.tar.gz"
  sha256 "eba9cd22896ebdf1b518b761008db692eecd5a0554b30f1ee40b07b11b7c9034"
  license "MIT"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/gc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gc version")
  end
end
