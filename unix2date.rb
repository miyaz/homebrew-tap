class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.3.1'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.1/unix2date_0.3.1_darwin_arm64.tar.gz'
      sha256 'd32659647bd5a25c17db0f84732466fc5aa9f8949bc842256c1e99a876d1273b'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.1/unix2date_0.3.1_darwin_amd64.tar.gz'
      sha256 '91ff66f515f06455f4b94b9ed1580a2a8f2b34b7d86f5a2a6b04b3179cb3eafb'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.1/unix2date_0.3.1_linux_arm64.tar.gz'
      sha256 '03953c8b24c4c9e4e2b45ceb9f8ac42ef69523721b517b82a7fb3ee5e2934a0f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.3.1/unix2date_0.3.1_linux_amd64.tar.gz'
      sha256 '048c7e20a5ef77f9bcf520cf29b260e475bba52e6ea6b427c1bbda0ed8b46255'
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
