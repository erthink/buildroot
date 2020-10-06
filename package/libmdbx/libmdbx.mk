################################################################################
#
# libmdbx
#
################################################################################

LIBMDBX_VERSION = 0.9.1
LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
LIBMDBX_LICENSE = OLDAP-2.8
LIBMDBX_LICENSE_FILES = LICENSE
LIBMDBX_REDISTRIBUTE = YES
LIBMDBX_STRIP_COMPONENTS = 0
LIBMDBX_INSTALL_STAGING = YES

LIBMDBX_CONF_OPTS = -DMDBX_INSTALL_MANPAGES=OFF -DBUILD_FOR_NATIVE_CPU=OFF \
	-DMDBX_INSTALL_STATIC=$(if $(BR2_STATIC_LIBS),ON,OFF) \
	-DMDBX_BUILD_SHARED_LIBRARY=$(if $(BR2_SHARED_LIBS),ON,OFF) \
	-DMDBX_BUILD_CXX=$(if $(BR2_PACKAGE_LIBMDBX_CXX),ON,OFF) \
	-DMDBX_BUILD_TOOLS=$(if $(BR2_PACKAGE_LIBMDBX_TOOLS),ON,OFF) \
	-DMDBX_LINK_TOOLS_NONSTATIC=$(if $(BR2_SHARED_LIBS),ON,OFF)

$(eval $(cmake-package))
