#encoding: utf-8
# 1 - 40
NOR1 = "0123456789　　ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

#NOR start with 6F
NOR =  "あぁいぃうぅえぇおぉかきくけこさしすせそたちつってとなにぬねのはひふへほまみむめもやゃゆゅよょらりるれろわをんアァイィウゥエェオォカキクケコサシスセソタチツッテトナニヌネノハヒフヘホマミムメモヤャユュヨョラリルレロワヲン"  #6F

#E0 start with 1
E0 =  "がぎぐげござじずぜぞだぢづでどばびぶべぼガギグゲゴザジズゼゾダヂヅデドバビブベボぱぴぷぺぽパピプペポ"

#E1 not known , start with 51
E1 = "-ー"

#E4 unicode data

def extract
  content = File.binread('./msg_battle.binJ')
  page_count = content[0, 4].unpack('i*')[0]
  p [ 'page_count', page_count ]
  total_item_count = 0
  0.upto(page_count - 1) do |page|
    item_count = content[4 + page * 4, 4].unpack('i*')[0]
    total_item_count += item_count
  end
  p [ 'total_item_count', total_item_count ]
  item_position_start = 4 + page_count * 4
  to_file = File.open('./test.txt', 'w')
  0.upto(total_item_count - 1) do |item|
    item_position = content[item_position_start + item * 4, 4].unpack('i*')[0]
    item_data = content[item_position..-1]
    str = ''
    scan_index = 0
    p [ item_position, item_data.length ]
    loop do
      c = item_data[scan_index, 1].unpack('C')[0]
      if c == 0xE3
        c2 = item_data[scan_index + 1, 1].unpack('C')[0]
        if c2 == 0x1B
          str += '{TR}'
          break
        elsif c2 == 0xB || c2 == 0x1C
          str += "{?%x-%x}" % [c, c2]
          c3 = item_data[scan_index + 2, 1].unpack('C')[0]
          str += "{?%x}" % c3
          scan_index += 1
        else
          str += "{?%x-%x}" % [c, c2]
        end
        scan_index += 2
      elsif c == 0xE0
        c2 = item_data[scan_index + 1, 1].unpack('C')[0]
        if c2 == 0 || c2 > E0.length
          str += "{?%x-%x}" % [c,c2]
        else
          str += E0[c2 - 1]
        end
        scan_index += 2
      elsif c == 0xE4
        p item_data[scan_index + 1, 2]
        c2 = item_data[scan_index + 1, 2].unpack('n*')[0]
        str += [c2].pack('U')
        p [c2].pack('U')
        scan_index += 3
      elsif c == 0xE1
        c2 = item_data[scan_index +1, 1].unpack('C')[0]
        if c2 > 0x50 and c2 < 0x53
            str += (E1[c2 - 0x52])
        elsif c2 == 8
            str += "?"
        elsif c2 == 0x60
            str += "&"
        elsif c2 == 0x3E
            str += ":"
        elsif c2 == 0x47
            str += "。"
        elsif c2 == 0x4f
            str += "！"
        else
            str += "{?%x-%x}" % [c,c2]
        end
        scan_index += 2
      elsif c == 0xE2
        c2 = item_data[scan_index +1, 1].unpack('C')[0]
        str += "{?%x-%x}" % [c,c2]
        scan_index += 2
      elsif c < 0xDD and c > 0x6E
        str += NOR[c - 0x6f]
        scan_index += 1
      elsif c < 0x41 and c > 0x0
        str += NOR1[c - 0x1]
        scan_index += 1
      else
        str += "{?%x}" % c
        scan_index += 1
      end
    end
    to_file.write str + "\r\n"
  end
ensure
  to_file.close
end
