
CPP=../../scripts/simplecpp

all: blasphem/texture1.lmp blasphdm/texture1.lmp

blasphem/texture1.lmp: textures.cfg
	@mkdir -p blasphem
	$(CPP) -DBLASPHEM < textures.cfg |                 \
	./build-textures -compat_texture1=heretic/texture1.txt   \
	                 -compat_texture2=heretic/texture2.txt   \
	                 -compat_pnames=heretic/pnames.txt       \
	                 -output_texture1=blasphem/texture1.lmp    \
	                 -output_texture2=blasphem/texture2.lmp    \
	                 -output_pnames=blasphem/pnames.lmp        \
	                 -output_pnames_txt=blasphem/pnames.txt    \
	                 -sprites_dir=../../sprites
	cp blasphem/texture1.lmp ../t1bsphem.lmp
	cp blasphem/texture2.lmp ../t2bsphem.lmp
	cp blasphem/pnames.lmp   ../pnbsphem.lmp

blasphdm/texture1.lmp: textures.cfg
	@mkdir -p blasphdm
	$(CPP) -DBLASPHDM < textures.cfg |                         \
	./build-textures -compat_texture1=heretic/texture1.txt     \
			 -compat_texture2=heretic/texture2.txt   \
	                 -compat_pnames=heretic/pnames.txt         \
	                 -output_texture1=blasphdm/texture1.lmp    \
	                 -output_texture2=blasphdm/texture2.lmp    \
	                 -output_pnames=blasphdm/pnames.lmp        \
	                 -output_pnames_txt=blasphdm/pnames.txt    \
	                 -sprites_dir=../../sprites
	cp blasphdm/texture1.lmp ../t1bsphdm.lmp
	cp blasphdm/texture2.lmp ../t2bsphdm.lmp
	cp blasphdm/pnames.lmp   ../pnbsphdm.lmp

clean:
	$(RM) blasphem/texture1.lmp blasphdm/texture1.lmp \
	      blasphem/texture2.lmp blasphdm/texture2.lmp \
	      blasphem/pnames.lmp   blasphdm/pnames.lmp   \
	      blasphem/pnames.txt   blasphdm/pnames.txt
	$(RM) ../t1bsphem.lmp ../t2bsphem.lmp ../pnbsphem.lmp \
	      ../t1bsphdm.lmp ../t2bsphdm.lmp ../pnbsphdm.lmp
	-rmdir blasphem blasphdm
