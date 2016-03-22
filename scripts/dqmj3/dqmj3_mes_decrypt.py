import os,sys,struct

filePath = "./Message/MonsterKindMessage.mes"
content=[]
with open(filePath,"rb") as sk:
	content = sk.read()

itemCount=struct.unpack("<I",content[0x0:0x4])[0]
print("Filename     : " , os.path.basename(filePath))
print("Item count   : " , itemCount )
print("\n----Item Name----|----Content----\n")
idx = 0x0
scanPos = 0x04
while idx < itemCount :
	idx+=1
	subCount = struct.unpack("<I",content[scanPos : scanPos + 0x4])[0]
	if subCount == 0 : 
		scanPos += 0x8
		continue
	subOffset = struct.unpack("<I",content[scanPos + 0x4 : scanPos + 0x8])[0] + 0x4
	scanPos += 0x8
	_suboffset = subOffset
	for subIdx in range(subCount):
		subItemEnd = content.find(b"\x00",_suboffset)
		subItemEnd += (4 - subItemEnd % 4)
		contentOffset = struct.unpack("<I",content[subItemEnd : subItemEnd + 0x4])[0]
		contentEnd = content.find(b'\x00\x00\x00',contentOffset)
		contentEnd2 = content.find(b'\x00\x00\x00\x00',contentOffset)
		if contentEnd == contentEnd2:
			contentEnd += 4
		else:
			contentEnd += 3
		print(content[_suboffset : subItemEnd].decode("ascii"), " \t ", content[contentOffset : contentEnd].decode("utf16"))
		_suboffset = subItemEnd + 0x4
