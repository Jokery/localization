MESSAGE_DIR = 'Message'
EXTRACT_DIR = '_extract_Message_txt'

CONVERTION = {
  "\n" => '{?e3-15}'
}

Dir.glob("#{MESSAGE_DIR}/**/*mes").each do |fname|
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
  File.open(fname.sub(MESSAGE_DIR, EXTRACT_DIR) + '.txt', 'w') { |f| f.write items.map { |item| item[1] + '{TR}' }.join("\n") }
end
