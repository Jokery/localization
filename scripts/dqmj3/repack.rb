TRANSLATE_DIR = '_translate_Message_txt'
REPACK_DIR = '_repack_Message'
MESSAGE_DIR = 'Message'

CONVERTION = {
  "\n" => '{?e3-15}',
  "\u0001" => '{?00-01}',
  "\u0002" => '{?00-02}',
  "\u0004" => '{?00-04}'
}

Dir.glob("#{TRANSLATE_DIR}/**/*txt").each do |fname|
  origin_content = File.binread(fname.sub(/\.txt$/, '').sub(TRANSLATE_DIR, MESSAGE_DIR))

  new_content_array = [ ]
  item_index_positions = [ ]

  item_count = origin_content[0, 4].unpack('I')[0]

  header_max = 0

  item_count.times do |index|
    sub_count = origin_content[ 4 + index * 8, 4 ].unpack('I')[0]
    if sub_count > 0
      offset = origin_content[ 4 + index * 8 + 4, 4 ].unpack('I')[0]

      scan_pos = offset

      sub_count.times do
        scan_pos += 4
        sub_item_name = ''
        while ( c = origin_content[scan_pos] ) != "\x00"
          sub_item_name += c
          scan_pos += 1
        end
        scan_pos += 4 - scan_pos % 4
        while origin_content[scan_pos, 4] == "\x00\x00\x00\x00"
          scan_pos += 4
        end

        header_max = scan_pos if scan_pos > header_max

        item_index_positions << [ sub_item_name, offset ]
      end
    end
  end

  item_index_positions.sort_by!(&:first)

  items = File.readlines(fname).map(&:chomp)
  if item_index_positions.length != items.length
    raise "#{fname} wrong line which should be #{item_index_positions.length}"
  end

  new_content_array << origin_content[0...header_max]

  items.each { |item| item.sub!('{TR}', '') }
    .each do |item|
    CONVERTION.each { |k, v| item.gsub!(v, k) }
  end

  position = header_max
  items.each_with_index do |item, index|
    new_content_array[0][ item_index_positions[index][1], 4 ] = [ position ].pack('I')
    bindata = item.split('').map { |chr| chr.unpack('U').pack('v') }.join('')
    bindata += "\x00" * ( 4 - bindata.length % 4 )
    new_content_array << bindata
    position += bindata.length
  end

  File.open(fname.sub(/\.txt$/, '').sub(TRANSLATE_DIR, REPACK_DIR), 'wb') { |f| f.write new_content_array.join('') }
end
