#encoding: utf-8
module BinJSerializer
  # 1 - 40
  NUMBERS = '0123456789'
  NOR1 = "0123456789　　ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

  #NOR start with 6F
  NOR =  "あぁいぃうぅえぇおぉかきくけこさしすせそたちつってとなにぬねのはひふへほまみむめもやゃゆゅよょらりるれろわをんアァイィウゥエェオォカキクケコサシスセソタチツッテトナニヌネノハヒフヘホマミムメモヤャユュヨョラリルレロワヲン"  #6F

  #E0 start with 1
  E0 =  "がぎぐげござじずぜぞだぢづでどばびぶべぼガギグゲゴザジズゼゾダヂヅデドバビブベボぱぴぷぺぽパピプペポ"

  #E1 not known , start with 51
  E1 = "-ー"

  def self.decode(item_data)
    length = item_data.length
    scan_index = 0
    str = ''
    while scan_index <= length - 1
      c = item_data[scan_index, 1].unpack('C')[0]
      raise scan_index if c.nil?
      if c == 0xE3
        c2 = item_data[scan_index + 1, 1].unpack('C')[0]
        if c2 == 0x1B
          c3 = item_data[scan_index + 2, 1].unpack('C')[0]
          if c3 == 0xE3
            str += '{?e3-1b}'
          else
            break
          end
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
        c2 = item_data[scan_index + 1, 2].unpack('n*')[0]
        str += [c2].pack('U')
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

    str
  end

  def self.encode(item, options)
    item_data = ''
    length = item.length
    index = 0
    while index <= length - 1
      char = item[index]
      if char == '{'
        end_index = item.index('}', index)
        item_data += get_macro(item[index..end_index])
        index = end_index + 1
      else
        if ( nor1_index = NUMBERS.index(char) )
          item_data += [ 0x1 + nor1_index ].pack('C')
        else
          item_data += options[:utf_prefix] + char.unpack('U').pack('n')
        end
        index += 1
      end
    end
    item_data += options[:endmacro]
    item_data += options[:appendfix] * ( 3 - ( item_data.length - 1 ) % 4 )
    item_data
  end

  def self.get_macro(macro)
    p1, p2 = macro[2..-2].split('-')
    if p2.nil?
      [ p1.to_i(16) ].pack('c')
    else
      [ [ p1, p2 ].map { |num| num.to_s.rjust(2, '0') }.join('').to_i(16) ].pack('n')
    end
  end
end
