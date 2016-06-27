s/UPSTREAM_GUIGFX_TARBALL := guigfxlib.lha/UPSTREAM_GUIGFX_TARBALL := guigfxlib/g
s#UPSTREAM_GUIGFX_URI := http://neoscientists.org/~bifat/binarydistillery/$(UPSTREAM_GUIGFX_TARBALL)#UPSTREAM_GUIGFX_URI := https://github.com/DNADNL/guigfxlib.git#g
s/UPSTREAM_RENDER_TARBALL := renderlib.lha/UPSTREAM_RENDER_TARBALL := renderlib/g
s#UPSTREAM_RENDER_URI := http://neoscientists.org/~bifat/binarydistillery/$(UPSTREAM_RENDER_TARBALL)#UPSTREAM_RENDER_URI := https://github.com/DNADNL/renderlib.git#g
s#mkdir -p $(BUILDDIR)/guigfxlib#cp -R $(UPSTREAM_GUIGFX_TARBALL) $(BUILDDIR)#g
s#lha xw=$(BUILDDIR)/guigfxlib $(SOURCESDIR)/$(UPSTREAM_GUIGFX_TARBALL)#rm -R $(UPSTREAM_GUIGFX_TARBALL)#g
s#mkdir -p $(BUILDDIR)/renderlib#cp -R $(UPSTREAM_RENDER_TARBALL) $(BUILDDIR)#g
s#lha xw=$(BUILDDIR)/renderlib $(SOURCESDIR)/$(UPSTREAM_RENDER_TARBALL)#rm -R $(UPSTREAM_RENDER_TARBALL)#g
s#renderlib/renderlib/include/#renderlib/include/#g
s#wget -q -O $@ $(UPSTREAM_GUIGFX_URI)#git clone $(UPSTREAM_GUIGFX_URI)#g
s#wget -q -O $@ $(UPSTREAM_RENDER_URI)#git clone $(UPSTREAM_RENDER_URI)#g

	

