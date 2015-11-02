# -*- encoding: utf-8 -*-
#coding=utf-8

import os,sys,struct

# 1 - 40
NOR1 = "0123456789　　ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

#NOR start with 6F
NOR =  "あぁいぃうぅえぇおぉかきくけこさしすせそたちつってとなにぬねのはひふへほまみむめもやゃゆゅよょらりるれろわをんアァイィウゥエェオォカキクケコサシスセソタチツッテトナニヌネノハヒフヘホマミムメモヤャユュヨョラリルレロワヲン"  #6F

#E0 start with 1
E0 =  "がぎぐげござじずぜぞだぢづでどばびぶべぼガギグゲゴザジズゼゾダヂヅデドバビブベボぱぴぷぺぽパピプペポ"

#E1 not known , start with 51
E1 = "-ー"

#E4 unicode data

def unpack(fileName,useCheckMode = False):

    testFile = "/Users/Joker/dqm2/Message/msg_"+ fileName + ".binJ"

    if useCheckMode:
        print(os.path.basename(testFile) + '*' * 50 + "\n")

    content = b""
    with open(testFile,"rb") as fp:
        content = fp.read()

    pageCount = struct.unpack("<i",content[0:4])[0]

    totalItemCount = 0

    for page in range(pageCount):
        pageItemCount = struct.unpack("<i",content[4 + 4 * page : 8+ 4*page])[0]
        totalItemCount += pageItemCount

    toPath = os.path.join(os.path.dirname(testFile), "org_unpack/"+os.path.basename(testFile)+".txt")
    toFP = ""
    if not useCheckMode:
        toFP = open(toPath,"w+")

    pageItemPosStart = 4 * pageCount + 4

    strline = 1

    for item in range(totalItemCount):
        itemPos = struct.unpack("<i", content[pageItemPosStart + 4 * item : pageItemPosStart + 4 * item +4])[0]
        itemData = content[itemPos : ]
        str = u""
        scanIndex = 0
        while(1):
            c = struct.unpack("B", itemData[scanIndex : scanIndex + 1])[0]
            if (c == 0xE3) :
                c2 = struct.unpack("B", itemData[scanIndex +1 : scanIndex + 2])[0]
                if c2 == 0x1B:
                    str += "{TR}"
                    break
                elif c2 == 0xB or c2 == 0x1C:
                    str += ("{?%x-%x}" % (c,c2))
                    c3 = struct.unpack("B", itemData[scanIndex +2 : scanIndex + 3])[0]
                    str += ("{?%x}" % c3)
                    scanIndex += 1
                else:
                    str += ("{?%x-%x}" % (c,c2))
                scanIndex += 2
                continue

            if c == 0xE0:
                c2 = struct.unpack("B", itemData[scanIndex +1 : scanIndex + 2])[0]

                if (c2 == 0 or c2 > len(E0)):
                    str += ("{?%x-%x}" % (c,c2))
                else:
                    str += (E0[c2 - 1])
                scanIndex += 2
                continue

            if c == 0xE4:
                c2 = struct.unpack(">H", itemData[scanIndex +1 : scanIndex + 3])[0]
                print(c2)
                str +=  chr(c2)
                scanIndex += 3
                continue

            if c == 0xE1:
                c2 = struct.unpack("B", itemData[scanIndex +1 : scanIndex + 2])[0]
                if c2 > 0x50 and c2 < 0x53:
                    str += (E1[c2 - 0x52])
                elif c2 == 8:
                    str += "?"
                elif c2 == 0x60:
                    str += "&"
                elif c2 == 0x3E:
                    str += ":"
                elif c2 == 0x47:
                    str += "。"
                elif c2 == 0x4f:
                    str += "！"
                else:
                    str += ("{?%x-%x}" % (c,c2))
                scanIndex += 2
                continue

            if  c == 0xE2:
                c2 = struct.unpack("B", itemData[scanIndex +1 : scanIndex + 2])[0]
                str += ("{?%x-%x}" % (c,c2))
                scanIndex += 2
                continue

            if c < 0xDD and c > 0x6E:
                str +=(NOR[c - 0x6f])
            elif c < 0x41 and c > 0x0:
                str += (NOR1 [c - 0x1])
            else:
                str += ("{?%x}" % c)

            scanIndex += 1
        if useCheckMode and str.__contains__("e3-1c"):
            print( "%d : %s" %(strline, str))
        if not useCheckMode:
            toFP.writelines(str + "\r\n")
        strline += 1
    if not useCheckMode:
        toFP.close()
    print(os.path.basename(testFile) + " Done.\n")

def unpackAll():
    files = os.listdir("/Users/Joker/dqm2/Message")
    for file in files:
        if file.__contains__("binJ"):
            unpack(file.replace("msg_","").replace(".binJ",""))

def unpackSpecify(files,useCheckMode = False):
    for file in files:
        unpack(file,useCheckMode)

#unpackSpecify(["field"])
unpackAll()
