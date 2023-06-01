#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app (must be on a single line)
pkg_dependencies="ntp ntpdate tzdata curl git imagemagick libssl-dev libreadline6-dev libncurses5-dev libffi-dev libgdbm-dev tzdata libc-dev autoconf bison libyaml-dev zlib1g-dev xz-utils postgresql postgresql-common postgresql-client libidn11-dev build-essential redis-server patch libjemalloc-dev libicu-dev libpq-dev apt-transport-https"

build_pkg_dependencies=""

memory_needed="2560"
ruby_version=3.2.2
nodejs_version=18.15.0

# Workaround for Mastodon on Bullseye
# See https://github.com/mastodon/mastodon/issues/15751#issuecomment-873594463
if [ "$(lsb_release --codename --short)" = "bullseye" ]; then
    case $YNH_ARCH in
        amd64)
            arch="x86_64"
            ;;
        arm64)
            arch="aarch64"
            ;;
        armel|armhf)
            arch="arm"
            ;;
        i386)
            arch="i386"
            ;;
    esac
    ld_preload="LD_PRELOAD=/usr/lib/$arch-linux-gnu/libjemalloc.so"
else
    ld_preload=""
fi

#=================================================
# PERSONAL HELPERS
#=================================================

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
