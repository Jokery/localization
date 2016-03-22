MESSAGE_DIR = 'Message'
EXTRACT_DIR = '_extract_Message_txt'
IDX_DIR = '_idx'

Dir.glob("#{MESSAGE_DIR}/**/*mes").each do |fname|
  content = File.binread(fname)
  item_count = content[0, 4].unpack('I*')[0]

  items = []
  item_count.times do |index|
    sub_count = content[ 4 + index * 8, 4 ].unpack('I*')[0]
    if sub_count > 0
      offset = content[ 4 + index * 8 + 4, 4 ].unpack('I*')[0]

      _sub_count = 0
      scan_pos = 0
      while _sub_count < sub_count
        _sub_count += 1

        sub_item_offset = content[offset, 4].unpack('I*')[0]
        # sub_item_offset = ( content[offset, 2] + "\x00\x00").unpack('I*')[0]
        scan_pos += 4
        sub_item_name = ''
        while ( c = content[offset + scan_pos] ) != "\x00"
          sub_item_name += c
          scan_pos += 1
        end
        while content[offset + scan_pos] == "\x00"
          scan_pos += 1
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

  File.open(fname.sub(MESSAGE_DIR, IDX_DIR) + '.idx', 'w') { |f| f.write items.map(&:first).join("\n") }
  File.open(fname.sub(MESSAGE_DIR, EXTRACT_DIR) + '.txt', 'w') { |f| f.write items.map(&:last).join("\n") }
end
