$(call TOOLS_INIT, 20.3.4)
# Since version 21 only Python3 is supported!
$(PKG)_SOURCE:=pip-$($(PKG)_VERSION).tar.gz
$(PKG)_HASH:=6773934e5f5fc3eaa8c5a44949b5b924fc122daa0a8aa9f80c835b4ca2a543fc
$(PKG)_SITE:=https://distfiles.macports.org/py-pip,https://files.pythonhosted.org/packages/53/7f/55721ad0501a9076dbc354cc8c63ffc2d6f1ef360f49ad0fbcce19d68538
### WEBSITE:=https://pypi.org/project/pip/
### MANPAGE:=https://pip.pypa.io/
### CHANGES:=https://pypi.org/project/pip/#history
### CVSREPO:=https://github.com/pypa/pip
### SUPPORT:=X

$(PKG)_DEPENDS_ON+=python2-host

$(PKG)_DIRECTORY:=$($(PKG)_DIR)/src/pip
$(PKG)_TARGET_DIRECTORY:=$(HOST_TOOLS_DIR)/usr/lib/python$(call GET_MAJOR_VERSION,$(PYTHON2_HOST_VERSION))/site-packages/pip


$(TOOLS_SOURCE_DOWNLOAD)
$(TOOLS_UNPACKED)

$($(PKG)_DIR)/.installed: $($(PKG)_DIR)/.unpacked
	cp -fa $(PYTHON2_PIP_HOST_DIRECTORY) $(dir $(PYTHON2_PIP_HOST_TARGET_DIRECTORY))
	@touch $@

$(pkg)-precompiled: $($(PKG)_DIR)/.installed


$(pkg)-clean:

$(pkg)-dirclean:
	$(RM) -r $(PYTHON2_PIP_HOST_DIR)

$(pkg)-distclean: $(pkg)-dirclean
	$(RM) -r $(PYTHON2_PIP_HOST_TARGET_DIRECTORY)

$(TOOLS_FINISH)
