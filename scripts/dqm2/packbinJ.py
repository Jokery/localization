#coding=utf-8
# __author__ = 'Aidoo'

import os,sys,struct,re

'''
if len(sys.argv) != 2:
    print("arg not correct.!")
    exit(0)
'''
fileName = sys.argv[1]
# fileName = "actionname"

orgFile = "./Message/msg_"+fileName+".binJ"
transFile = os.path.join(os.path.dirname(orgFile), "../_trans_Message/"+os.path.basename(orgFile)+".txt")
print(orgFile)
print(transFile)

content = []
with open(transFile) as transHandler:
    line = transHandler.readline()
    while ( line and len(line) > 0):
        content.append(line.replace("\n",""))
        line = transHandler.readline()


def getMacroData(macro):
    if macro == "{TR}":
        return struct.pack(">H",0xE31B)
    ps = re.subn("[\{\?\}]","",macro)[0]
    pss = ps.split("-")

    if len(pss) > 1:
        p1 = pss[0]
        p2 = pss[1]
        if len(p2) == 1:
            p2 = "0" + p2
        pp = p1 + p2
        return struct.pack(">H",int(pp,base=16))
    else:
        return struct.pack("B",int(ps,base=16))

def getStringData(str):
    result = b''
    strlen = len(str)
    idx = 0
    uCon = struct.pack("B",0xE4)

    while idx < strlen:
        c = str[idx]
        if c == '{':
            endPos = str.index('}',idx)
            macro = str[idx : endPos + 1]
            result += getMacroData(macro)
            idx = endPos + 1
        else:
            cVal = ord(c)
            result += uCon

            cbVal = struct.pack(">H",cVal)
            result += cbVal
            idx += 1
    return result



orgContent = b''
with open(orgFile,"rb") as orgHandler:
    orgContent = orgHandler.read()

pageCount = struct.unpack("<I",orgContent[0 : 4])[0]
totalItemCount = 0
for page in range(pageCount):
    pageItemsCount = struct.unpack("<I",orgContent[4 + 4 * page : 8 + 4 * page])[0]
    totalItemCount += pageItemsCount

headerLen = 4 + pageCount * 4 + totalItemCount * 4
headerItemStartPos = 4 + pageCount * 4
header = bytearray(orgContent[0 : headerLen ])

itemPos = headerLen
resultContent = b''
lineIdx = 0
for line in content:

    #更新header
    posData = struct.pack("<I",itemPos)
    header[headerItemStartPos + 4 * lineIdx : headerItemStartPos + 4 * lineIdx + 4] = posData
    lineContent = getStringData(line)

    resultContent += lineContent
    itemPos += len(lineContent)
    lineIdx +=1

if(totalItemCount == lineIdx):
    resultFile = transFile = os.path.join(os.path.dirname(orgFile), "../_repack_Message/"+os.path.basename(orgFile))
    resultHandler = open(resultFile,"wb+")
    resultHandler.write(header)
    resultHandler.write(resultContent)
    resultHandler.close()
    print("Done")
else:
    print("failed. length not match")



