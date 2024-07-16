class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.1.0'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.0/unix2date_0.1.0_darwin_arm64.tar.gz'
      sha256 'db0116e79016e1655cea6082cfa2b33e1245de9e2196e40be2c82e329b216c48'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.0/unix2date_0.1.0_darwin_amd64.tar.gz'
      sha256 'ec7febc91b79666411988f2f07ed541ac50ff3196062b6a1cbfe2d48f9ea1ee8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.0/unix2date_0.1.0_linux_arm64.tar.gz'
      sha256 '78330e961f49d06c52f3114386675bcc3cc6f917b6cf1c0490c8e7372991363c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.1.0/unix2date_0.1.0_linux_amd64.tar.gz'
      sha256 'bea61bf3a936b7a8a4ccdccc7a92eeadf0e5952d276b5096342c29219f01001e'
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
