RD /S /Q cci
MD cci
REM 从怪物猎人4的3ds文件提取0.cxi(主应用)和1.cfa(电子说明书),7.cfa(系统更新),还有cci文件头
tools\3dstool -xvt017f cci cci\0.cxi cci\1.cfa cci\7.cfa kirin-mh4j.3ds --header cci\ncsdheader.bin
MD cci\cxi0
REM 从0.cxi文件提取cxi头文件,exh文件,logo文件,plain文件,exefs文件,romfs文件,并在过程中使用异或文件解密exh文件,exefs文件,romfs文件
tools\3dstool -xvtf cxi cci\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.bcma.lz --plain cci\cxi0\plain.bin --exefs cci\cxi0\exefs.bin --romfs cci\cxi0\romfs.bin --exh-xor 000400000004B500.Main.exheader.xorpad --exefs-xor 000400000004B500.Main.exefs_norm.xorpad --romfs-xor 000400000004B500.Main.romfs.xorpad
DEL cci\0.cxi
MD cci\cfa1
REM 从1.cfa文件提取cfa头文件,romfs文件,并在过程中使用异或文件解密romfs文件
tools\3dstool -xvtf cfa cci\1.cfa --header cci\cfa1\ncchheader.bin --romfs cci\cfa1\romfs.bin --romfs-xor 000400000004B500.Manual.romfs.xorpad
DEL cci\1.cfa
MD cci\cfa7
REM 从7.cfa文件提取cfa头文件,romfs文件,并在过程中使用异或文件解密romfs文件
tools\3dstool -xvtf cfa cci\7.cfa --header cci\cfa7\ncchheader.bin --romfs cci\cfa7\romfs.bin --romfs-xor 000400000004B500.UpdateData.romfs.xorpad
DEL cci\7.cfa
REM 从exefs.bin文件提取exefs头文件并将内容提取到exefs文件夹
tools\3dstool -xvtfu exefs cci\cxi0\exefs.bin --header cci\cxi0\exefs\exefsheader.bin --exefs-dir cci\cxi0\exefs
DEL cci\cxi0\exefs.bin
REM 将romfs.bin的内容提取到romfs文件夹
tools\3dstool -xvtf romfs cci\cxi0\romfs.bin --romfs-dir cci\cxi0\romfs
DEL cci\cxi0\romfs.bin
tools\3dstool -xvtf romfs cci\cfa1\romfs.bin --romfs-dir cci\cfa1\romfs
DEL cci\cfa1\romfs.bin
tools\3dstool -xvtf romfs cci\cfa7\romfs.bin --romfs-dir cci\cfa7\romfs
DEL cci\cfa7\romfs.bin
PAUSE
