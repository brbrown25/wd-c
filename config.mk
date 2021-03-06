CC ?= gcc
CFLAGS ?= -Wall -std=gnu99

# set prefix according to OS
ifeq ($(UNAME),Darwin) # Mac OS X
PREFIX ?= /usr/local
PREFIX_SHARE ?= /usr/share
else # Linux
PREFIX ?= /usr/bin
PREFIX_SHARE ?= /usr/share
endif

NAME = wd

SDIR = src
ODIR = bin
TDIR = test
LDIR = lib
SRC = $(wildcard $(SDIR)/*.c)
OBJ = $(patsubst $(SDIR)/%.c, $(ODIR)/%.o, $(SRC))

TARGET   ?= $(ODIR)/$(NAME)
WRAPPERS ?= $(wildcard $(LDIR)/$(NAME).*)
CONFIG   ?= ~/.warprc

TTARGET ?= $(ODIR)/$(NAME)-test
TLIBS   ?= -lcmocka
TCONFIG ?= $(LDIR)/test_warprc
