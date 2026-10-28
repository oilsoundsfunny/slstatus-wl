# slstatus version
VERSION = 1.1

# customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -DVERSION=\"${VERSION}\"
CFLAGS = -std=gnu2y -O3 -flto=thin \
	-fdata-sections -ffunction-sections \
	-fstack-clash-protection -fstack-protector-strong
LDFLAGS = -fuse-ld=lld -flto=thin \
	-Wl,--as-needed,-O4,-z,now,-z,relro
# OpenBSD: add -lsndio
# FreeBSD: add -lkvm -lsndio

# compiler and linker
CC = clang \
	-Xclang -load -Xclang LLVMPolly.so \
	-mllvm -polly \
	-mllvm -polly-position=before-vectorizer \
	-mllvm -polly-vectorizer=stripmine
