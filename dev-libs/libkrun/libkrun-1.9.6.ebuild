# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	annotate-snippets@0.9.2
	anyhow@1.0.86
	atty@0.2.14
	autocfg@1.3.0
	base64@0.22.1
	bincode@1.3.3
	bindgen@0.69.4
	bitfield@0.15.0
	bitflags@1.3.2
	bitflags@2.5.0
	bumpalo@3.16.0
	byteorder@1.5.0
	cc@1.0.98
	cexpr@0.6.0
	cfg-expr@0.15.8
	cfg-if@1.0.0
	chrono@0.4.38
	clang-sys@1.8.1
	codicon@3.0.0
	convert_case@0.6.0
	cookie-factory@0.3.3
	core-foundation-sys@0.8.6
	crc32fast@1.4.2
	crossbeam-channel@0.5.13
	crossbeam-utils@0.8.20
	curl-sys@0.4.72+curl-8.6.0
	curl@0.4.46
	dirs-sys@0.4.1
	dirs@5.0.1
	either@1.12.0
	env_logger@0.9.3
	equivalent@1.0.1
	flate2@1.0.30
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	getrandom@0.2.15
	glob@0.3.1
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.1.19
	hex@0.4.3
	humantime@2.1.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.60
	indexmap@2.2.6
	iocuddle@0.1.1
	itertools@0.12.1
	itoa@1.0.11
	js-sys@0.3.69
	kbs-types@0.7.0
	kvm-bindings@0.8.2
	kvm-ioctls@0.17.0
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.155
	libloading@0.8.3
	libredox@0.1.3
	libspa-sys@0.8.0
	libspa@0.8.0
	libz-sys@1.1.18
	log@0.4.21
	lru@0.12.3
	memchr@2.7.2
	memoffset@0.6.5
	memoffset@0.7.1
	minimal-lexical@0.2.1
	miniz_oxide@0.7.3
	nix@0.24.3
	nix@0.26.4
	nix@0.27.1
	nom@7.1.3
	num-traits@0.2.19
	once_cell@1.19.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.102
	openssl@0.10.64
	option-ext@0.2.0
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pipewire-sys@0.8.0
	pipewire@0.8.0
	pkg-config@0.3.30
	ppv-lite86@0.2.17
	proc-macro2@1.0.85
	procfs@0.12.0
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_users@0.4.5
	regex-automata@0.4.6
	regex-syntax@0.8.3
	regex@1.10.4
	remain@0.2.14
	rustc-hash@1.1.0
	ryu@1.0.18
	schannel@0.1.23
	serde-big-array@0.5.1
	serde@1.0.203
	serde_bytes@0.11.14
	serde_derive@1.0.203
	serde_json@1.0.117
	serde_spanned@0.6.6
	sev@3.2.0
	shlex@1.3.0
	slab@0.4.9
	smallvec@1.13.2
	socket2@0.5.7
	static_assertions@1.1.0
	syn@2.0.66
	system-deps@6.2.2
	target-lexicon@0.12.14
	termcolor@1.4.1
	thiserror-impl@1.0.61
	thiserror@1.0.61
	toml@0.8.14
	toml_datetime@0.6.6
	toml_edit@0.22.14
	unicode-ident@1.0.12
	unicode-segmentation@1.11.0
	unicode-width@0.1.12
	uuid@1.8.0
	vcpkg@0.2.15
	version-compare@0.2.0
	version_check@0.9.4
	virtio-bindings@0.2.2
	vm-fdt@0.3.0
	vm-memory@0.16.0
	vmm-sys-util@0.12.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.8
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.6.11
	yansi-term@0.1.2
	zerocopy-derive@0.6.6
	zerocopy-derive@0.7.34
	zerocopy@0.6.6
	zerocopy@0.7.34
"

inherit cargo

DESCRIPTION="A dynamic library providing Virtualization-based process isolation capabilities"
HOMEPAGE="https://github.com/containers/libkrun"

SRC_URI="
	${CARGO_CRATE_URIS}
	https://github.com/containers/libkrun/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RDEPEND="
	dev-libs/libkrunfw
	media-libs/virglrenderer
	media-video/pipewire
"
DEPEND="
	${RDEPEND}
"
BDEPEND="
	dev-util/patchelf
"
src_compile() {
	unset ARCH
	emake PREFIX=/usr GPU=1 BLK=1 NET=1 SND=1
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
