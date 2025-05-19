$(call TOOLS_INIT, 44.1.1)
# Since version 45 only Python3 is supported!
$(PKG)_SOURCE:=setuptools-$($(PKG)_VERSION).zip
$(PKG)_HASH:=c67aa55db532a0dadc4d2e20ba9961cbd3ccc84d544e9029699822542b5a476b
$(PKG)_SITE:=https://distfiles.macports.org/py-setuptools,https://files.pythonhosted.org/packages/b2/40/4e00501c204b457f10fe410da0c97537214b2265247bc9a5bc6edd55b9e4
### WEBSITE:=https://pypi.org/project/setuptools/
### MANPAGE:=https://setuptools.pypa.io/
### CHANGES:=https://pypi.org/project/setuptools/#history
### CVSREPO:=https://github.com/pypa/setuptools
### SUPPORT:=X

$(PKG)_DEPENDS_ON+=python2-host

$(PKG)_SUBDIRS:=pkg_resources setuptools
$(PKG)_DIRECTORIES:=$(addprefix $($(PKG)_DIR)/,$($(PKG)_SUBDIRS))
$(PKG)_TARGET_DIRECTORY:=$(HOST_TOOLS_DIR)/usr/lib/python$(call GET_MAJOR_VERSION,$(PYTHON2_HOST_VERSION))/site-packages/setuptools


$(TOOLS_SOURCE_DOWNLOAD)
$(TOOLS_UNPACKED)

$($(PKG)_DIR)/.installed: $($(PKG)_DIR)/.unpacked
	for x in $(PYTHON2_SETUPTOOLS_HOST_DIRECTORIES); do \
	echo cp -fa $${x} $(dir $(PYTHON2_SETUPTOOLS_HOST_TARGET_DIRECTORY)); \
	done
	@touch $@

$(pkg)-precompiled: $($(PKG)_DIR)/.installed


$(pkg)-clean:

$(pkg)-dirclean:
	$(RM) -r $(PYTHON2_SETUPTOOLS_HOST_DIR)

$(pkg)-distclean: $(pkg)-dirclean
	$(RM) -r $(PYTHON2_SETUPTOOLS_HOST_TARGET_DIRECTORY)

$(TOOLS_FINISH)
