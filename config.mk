# slstatus version
VERSION = 1.1

# customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -DVERSION=\"${VERSION}\"
CFLAGS   = -std=c99 -pedantic -Wall -Wextra -Wno-unused-parameter -Os
LDFLAGS  = -s
# OpenBSD: add -lsndio
# FreeBSD: add -lkvm -lsndio

# compiler and linker
CC = cc
