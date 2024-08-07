class Unix2date < Formula
  desc 'unix2date is a command that converts unixtime included in STDIN to datetime and output'
  version '0.2.0'
  homepage 'https://github.com/miyaz/unix2date'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.2.0/unix2date_0.2.0_darwin_arm64.tar.gz'
      sha256 'e8928e1c7aa401be05b22b7e2452a883c776c372f8c5c9123008fc745fe2922d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.2.0/unix2date_0.2.0_darwin_amd64.tar.gz'
      sha256 'eedcdf2908f918c4d84839b99280421e16af0990065b847a366dff3272b18d9f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.2.0/unix2date_0.2.0_linux_arm64.tar.gz'
      sha256 '9af543f39e02e1e5d670a08cbb92d7f50f26dae23e37afbd874b03b2e8444664'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/miyaz/unix2date/releases/download/v0.2.0/unix2date_0.2.0_linux_amd64.tar.gz'
      sha256 '36fab3e0517f477a3b3d7b8cc67965a0f20d36904c752b93d483fe157ad3eb7f'
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
