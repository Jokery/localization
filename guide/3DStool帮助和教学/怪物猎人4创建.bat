REM ͨ��exefs�ļ�ͷ��exefs�ļ�������������exefs.bin
tools\3dstool -cvtfz exefs cci\cxi0\exefs.bin --header cci\cxi0\exefs\exefsheader.bin --exefs-dir cci\cxi0\exefs
REM ͨ��romfs�ļ�������������romfs.bin
tools\3dstool -cvtf romfs cci\cxi0\romfs.bin --romfs-dir cci\cxi0\romfs
MD cci\cfa1
tools\3dstool -cvtf romfs cci\cfa1\romfs.bin --romfs-dir cci\cfa1\romfs
MD cci\cfa7
tools\3dstool -cvtf romfs cci\cfa7\romfs.bin --romfs-dir cci\cfa7\romfs
REM ͨ��cxiͷ�ļ�,exh�ļ�,logo�ļ�,plain�ļ�,exefs�ļ�,romfs�ļ�����������cxi�ļ�,���ڹ�������AES-CTR��ϵͳ��Կ����exh�ļ�,exefs�ļ�,romfs�ļ�
tools\3dstool -cvtf cxi cci\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.bin --plain cci\cxi0\plain.bin --exefs cci\cxi0\exefs.bin --romfs cci\cxi0\romfs.bin --key0
REM ͨ��cfaͷ�ļ�,romfs�ļ�����������cfa�ļ�,���ڹ�������������romfs�ļ�
tools\3dstool -cvtf cfa cci\1.cfa --header cci\cfa1\ncchheader.bin --romfs cci\cfa1\romfs.bin --romfs-xor 000400000004B500.Manual.romfs.xorpad
tools\3dstool -cvtf cfa cci\7.cfa --header cci\cfa7\ncchheader.bin --romfs cci\cfa7\romfs.bin --romfs-xor 000400000004B500.UpdateData.romfs.xorpad
REM ͨ��cciͷ�ļ�,0.cxi�ļ�1.cfa�ļ�,7.cfa�ļ�����������cci�ļ�
tools\3dstool -cvt017f cci cci\0.cxi cci\1.cfa cci\7.cfa mh4.3ds --header cci\ncsdheader.bin
PAUSE
