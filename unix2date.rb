class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.0.6'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.0.6/unix2date_0.0.6_darwin_arm64.tar.gz'
      sha256 '6bf71ab9651e5fbc00755d1c4b1a34b437c4a596ad6c9f66deacc0cf1da7fd48'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.0.6/unix2date_0.0.6_darwin_amd64.tar.gz'
      sha256 '6e0e5353a392397d9885191b91189e222ee7ff2410a9e13e72e3ec738ee1c6b4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.0.6/unix2date_0.0.6_linux_arm64.tar.gz'
      sha256 'e54e99ea72046f9cc40d1c97a08574ef53082a6a35b4ea3941f46a1ed65cba1a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.0.6/unix2date_0.0.6_linux_amd64.tar.gz'
      sha256 'b1150973b8ba5598b58d8d2a73c5a66620d23fdbc2a6a1bdc48ef238abf41a30'
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
