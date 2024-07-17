class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.1.1'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.1/unix2date_0.1.1_darwin_arm64.tar.gz'
      sha256 'cb0b27f3cc2f69db72b25bcaadafe4a46a83dd72787e0055e1d91e0cd4743684'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.1/unix2date_0.1.1_darwin_amd64.tar.gz'
      sha256 'cc2e9dd2cd5285dba87f4acec15f760f460ee7d8f43e56ff698221c09dbe50fb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.1/unix2date_0.1.1_linux_arm64.tar.gz'
      sha256 'bf4ea7c7e1f717c2fa24985dd75a5f72974196bcef933329f1d93d9c26242a97'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.1/unix2date_0.1.1_linux_amd64.tar.gz'
      sha256 'fe8ea24c0cd36071216a88a73879b9a82fd0ce04e25d5aa31e90a42342a71ea9'
    end
  end

  head do
    url 'https://github.com/miyaz/unix2date.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/miyaz/unix2date'
      ln_s buildpath/'search', buildpath/'src/github.com/miyaz/unix2date/.'
      system 'go', 'build', '-o', 'unix2date'
    end
    bin.install 'unix2date'
  end
end
