RD /S /Q cci
MD cci
REM �ӹ�������4��3ds�ļ���ȡ0.cxi(��Ӧ��)��1.cfa(����˵����),7.cfa(ϵͳ����),����cci�ļ�ͷ
tools\3dstool -xvt017f cci cci\0.cxi cci\1.cfa cci\7.cfa kirin-mh4j.3ds --header cci\ncsdheader.bin
MD cci\cxi0
REM ��0.cxi�ļ���ȡcxiͷ�ļ�,exh�ļ�,logo�ļ�,plain�ļ�,exefs�ļ�,romfs�ļ�,���ڹ�����ʹ������ļ�����exh�ļ�,exefs�ļ�,romfs�ļ�
tools\3dstool -xvtf cxi cci\0.cxi --header cci\cxi0\ncchheader.bin --exh cci\cxi0\exh.bin --logo cci\cxi0\logo.bcma.lz --plain cci\cxi0\plain.bin --exefs cci\cxi0\exefs.bin --romfs cci\cxi0\romfs.bin --exh-xor 000400000004B500.Main.exheader.xorpad --exefs-xor 000400000004B500.Main.exefs_norm.xorpad --romfs-xor 000400000004B500.Main.romfs.xorpad
DEL cci\0.cxi
MD cci\cfa1
REM ��1.cfa�ļ���ȡcfaͷ�ļ�,romfs�ļ�,���ڹ�����ʹ������ļ�����romfs�ļ�
tools\3dstool -xvtf cfa cci\1.cfa --header cci\cfa1\ncchheader.bin --romfs cci\cfa1\romfs.bin --romfs-xor 000400000004B500.Manual.romfs.xorpad
DEL cci\1.cfa
MD cci\cfa7
REM ��7.cfa�ļ���ȡcfaͷ�ļ�,romfs�ļ�,���ڹ�����ʹ������ļ�����romfs�ļ�
tools\3dstool -xvtf cfa cci\7.cfa --header cci\cfa7\ncchheader.bin --romfs cci\cfa7\romfs.bin --romfs-xor 000400000004B500.UpdateData.romfs.xorpad
DEL cci\7.cfa
REM ��exefs.bin�ļ���ȡexefsͷ�ļ�����������ȡ��exefs�ļ���
tools\3dstool -xvtfu exefs cci\cxi0\exefs.bin --header cci\cxi0\exefs\exefsheader.bin --exefs-dir cci\cxi0\exefs
DEL cci\cxi0\exefs.bin
REM ��romfs.bin��������ȡ��romfs�ļ���
tools\3dstool -xvtf romfs cci\cxi0\romfs.bin --romfs-dir cci\cxi0\romfs
DEL cci\cxi0\romfs.bin
tools\3dstool -xvtf romfs cci\cfa1\romfs.bin --romfs-dir cci\cfa1\romfs
DEL cci\cfa1\romfs.bin
tools\3dstool -xvtf romfs cci\cfa7\romfs.bin --romfs-dir cci\cfa7\romfs
DEL cci\cfa7\romfs.bin
PAUSE
