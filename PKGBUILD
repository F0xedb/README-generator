pkgname=readme-generator
pkgver=1
pkgrel=1
pkgdesc="A basic tool to generate modern readme's"
arch=(any)
url="https://github.com/F0xedb/README-generator"
license=('GPL')

source=("readme-gen" "demo")
md5sums=(a1d1a0931eef75bf3a99038b453d157f 20de561f5db44d25b778036c2047d371)

prepare() {
    chmod +x readme-gen # Make sure our package is executable
    echo "Preparing the source files"
}

build() {
    echo "Compiling source"
}

check() {
    echo "Verifying if files are correct, eg unit testing, make check"
}

package() {
    echo "Packaging the compiled files"
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/var/cache/readme
    cp readme-gen $pkgdir/usr/bin
    cp demo $pkgdir/var/cache/readme/demo
}
