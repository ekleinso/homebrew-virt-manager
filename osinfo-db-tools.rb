class OsinfoDbTools < Formula
  desc "Tools for managing the libosinfo database files"
  homepage "https://libosinfo.org"
  url "https://releases.pagure.org/libosinfo/osinfo-db-tools-1.9.0.tar.xz"
  sha256 "255f1c878bacec70c3020ff5a9cb0f6bd861ca0009f24608df5ef6f62d5243c0"

  depends_on "pkg-config" => :build

  depends_on "gettext"
  depends_on "glib"
  depends_on "json-glib"
  depends_on "libarchive" # need >= 3.0.0
  depends_on "libsoup"

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-silent-rules
      --prefix=#{prefix}
      --localstatedir=#{var}
      --sysconfdir=#{etc}
    ]
    system "./configure", *args
    system "make", "install"
  end

  test do
    system "#{bin}/osinfo-db-path"
  end
end
