REM 通过exefs文件头和exefs文件夹来重新生成exefs.bin
tools\3dstool -cvtfz exefs cci\cxi0\exefs.bin --header cci\cxi0\exefs\exefsheader.bin --exefs-dir cci\cxi0\exefs
REM 通过romfs文件夹来重新生成romfs.bin
tools\3dstool -cvtf romfs cci\cxi0\romfs.bin --romfs-dir cci\cxi0\romfs
MD cci\cfa1
tools\3dstool -cvtf romfs cci\cfa1\romfs.bin --romfs-dir cci\cfa1\romfs
MD cci\cfa7
tools\3dstool -cvtf romfs cci\cfa7\romfs.bin --romfs-dir cci\cfa7\romfs
REM 通过cxi头文件,exh文件,logo文件,plain文件,exefs文件,romfs文件来重新生成cxi文件,并在过程中用AES-CTR的系统密钥加密exh文件,exefs文件,romfs文件
tools\3dstool -cvtf cxi cci\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.bin --plain cci\cxi0\plain.bin --exefs cci\cxi0\exefs.bin --romfs cci\cxi0\romfs.bin --key0
REM 通过cfa头文件,romfs文件来重新生成cfa文件,并在过程中用异或加密romfs文件
tools\3dstool -cvtf cfa cci\1.cfa --header cci\cfa1\ncchheader.bin --romfs cci\cfa1\romfs.bin --romfs-xor 000400000004B500.Manual.romfs.xorpad
tools\3dstool -cvtf cfa cci\7.cfa --header cci\cfa7\ncchheader.bin --romfs cci\cfa7\romfs.bin --romfs-xor 000400000004B500.UpdateData.romfs.xorpad
REM 通过cci头文件,0.cxi文件1.cfa文件,7.cfa文件来重新生成cci文件
tools\3dstool -cvt017f cci cci\0.cxi cci\1.cfa cci\7.cfa mh4.3ds --header cci\ncsdheader.bin
PAUSE
