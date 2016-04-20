# encoding: utf-8
MESSAGE_DIR = 'Message'
EXTRACT_DIR = '_extract_Message_txt2'

SKIP_MES = [
  'IconMessage',
  'NameMessage'
]
JP_WITH_DESC_MES = [
  [ 'ActionFndMessage', 'ActionHelpMessage', 'ActionWithDesc' ],
  [ 'FeatFndMessage', 'FeatHelpMessage', 'FeatWithDesc' ],
  [ 'ItemMessage', 'ItemHelpMessage', 'ItemWithDesc' ],
  [ 'MonsterKindMessage', 'MonsterTriviaMessage', 'MonsterWithDesc' ],
  [ 'SkillMessage', 'SkillHelpMessage', 'SkillWithDesc' ],
  [ 'TrophyName', 'TrophyMessage', 'TrophyWithDesc' ]
]

SKIP_JP = [
  '-',
  proc { |item| item.include? '（削除）' },
  proc { |item| item =~ /^[\-\s]+$/ }
]

CONVERTION = {
  "\u0001" => '{?00-01}',
  "\u0002" => '{?00-02}',
  "\u0004" => '{?00-04}'
}

def skip_jp?(item)
  return false if item.nil?
  SKIP_JP.each do |condition|
    if condition.respond_to?(:call)
      return true if condition.call(item)
    else
      return true if condition == item
    end
  end
  return false
end

def extract_jp(fname)
  content = File.binread(fname)
  item_count = content[0, 4].unpack('I')[0]

  items = []
  item_count.times do |index|
    sub_count = content[ 4 + index * 8, 4 ].unpack('I')[0]
    if sub_count > 0
      offset = content[ 4 + index * 8 + 4, 4 ].unpack('I')[0]

      scan_pos = offset
      sub_count.times do
        sub_item_offset = content[scan_pos, 4].unpack('I*')[0]
        scan_pos += 4
        sub_item_name = ''
        while ( c = content[scan_pos] ) != "\x00"
          sub_item_name += c
          scan_pos += 1
        end
        scan_pos += 4 - scan_pos % 4
        while content[scan_pos, 4] == "\x00\x00\x00\x00"
          scan_pos += 4
        end

        str = ''
        char_position = sub_item_offset
        while ( char_bytes = content[char_position, 2] ) != "\x00\x00"
          str += ( char_bytes + "\x00\x00" ).unpack('I*').pack('U')
          char_position += 2
        end

        items << [ sub_item_name, str ]
      end
    end
  end

  items.sort_by!(&:first)
  items.each do |item|
    CONVERTION.each do |k, v|
      item[1].gsub!(k, v)
    end
  end
  return items.map(&:last)
end
JP_WITH_DESC_MES.each do |jp, desc, outfile|
  jp_fname = "#{MESSAGE_DIR}/#{jp}.mes"
  desc_fname = "#{MESSAGE_DIR}/#{desc}.mes"
  out_fname = "#{EXTRACT_DIR}/#{outfile}.txt"
  jps = extract_jp(jp_fname)
  descs = extract_jp(desc_fname)
  File.open(out_fname, 'w') do |f|
    length = [ jps.size, descs.size ].max
    0.upto(length - 1).each do |i|
      jp = jps[i]
      desc = descs[i]
      next if skip_jp?(jp)

      f.write "\nNo.#{i+1}\n"
      if jp
        f.write "-------------Name---------------------\n"
        f.write jp + "\n"
        f.write "======================================\n"
        f.write jp + "\n"
      end
      if desc
        f.write "------------Description---------------\n"
        f.write desc + "\n"
        f.write "======================================\n"
        f.write desc + "\n"
      end
      f.write "--------------------------------------\n"
      f.write "\n"
    end
  end
end
