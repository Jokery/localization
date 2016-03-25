3dstool -cvtf romfs cxi0/hack_romfs.bin --romfs-dir cxi0/romfs --romfs cxi0/romfs.bin
3dstool -cvtf cxi hack_0.cxi --header cxi0/ncchheader.bin --exh cxi0/exh.bin --logo cxi0/logo.bcma.lz --plain cxi0/plain.bin --exefs cxi0/exefs.bin --romfs cxi0/hack_romfs.bin --exh-xor *Main.exheader.xorpad --exefs-xor *Main.exefs_norm.xorpad --romfs-xor *Main.romfs.xorpad
3dstool -cvt017f cci hack_0.cxi 1.cfa 7.cfa repack.3ds --header ncsdheader.bin
