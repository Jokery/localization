file=$1
3dstool -xvt017f cci 0.cxi 1.cfa 7.cfa $file --header ncsdheader.bin
mkdir -p cxi0/romfs
3dstool -xvtf cxi 0.cxi --header cxi0/ncchheader.bin --logo cxi0/logo.bcma.lz --exh cxi0/exh.bin --plain cxi0/plain.bin --exefs cxi0/exefs.bin --romfs cxi0/romfs.bin --exh-xor *Main.exheader.xorpad --exefs-xor *Main.exefs_norm.xorpad --romfs-xor *Main.romfs.xorpad
3dstool -xvtf romfs cxi0/romfs.bin --romfs-dir cxi0/romfs
