
CPP=../../scripts/simplecpp

all: lastermaul/texture1.lmp

lastermaul/texture1.lmp: textures.cfg
	@mkdir -p lastermaul
	$(CPP) -DLASTERMAUL < textures.cfg |                 \
	./build-textures -compat_texture1=hexen/texture1.txt   \
	                 -compat_texture2=hexen/texture2.txt   \
	                 -compat_pnames=hexen/pnames.txt       \
	                 -output_texture1=lastermaul/texture1.lmp    \
	                 -output_texture2=lastermaul/texture2.lmp    \
	                 -output_pnames=lastermaul/pnames.lmp        \
	                 -output_pnames_txt=lastermaul/pnames.txt    \
	                 -sprites_dir=../../sprites
	cp lastermaul/texture1.lmp ../t1lstrml.lmp
	cp lastermaul/texture2.lmp ../t2lstrml.lmp
	cp lastermaul/pnames.lmp   ../pnlstrml.lmp

clean:
	$(RM) lastermaul/texture1.lmp \
	      lastermaul/texture2.lmp \
	      lastermaul/pnames.lmp \
	      lastermaul/pnames.txt
	$(RM) ../t1lstrml.lmp ../t2lstrml.lmp ../pnlstrml.lmp
	-rmdir lastermaul
