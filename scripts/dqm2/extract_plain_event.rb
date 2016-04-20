require 'zlib'
load File.expand_path('../serializer.rb', __FILE__)

EVENT_DIR = 'Event'
EXTRACT_DIR = '_extract_Event_txt_plain'

Dir.glob("#{EVENT_DIR}/**/*.e").each do |fname|
  content = nil
  Zlib::GzipReader.open(fname) { |gz| content = gz.read }

  index = 0
  index2item = { }
  while ( four = content[index, 4] )
    index += 4
    next unless four == "\x43\x00\x00\x00" or four == "\x84\x00\x00\x00"
    length = content[index, 4].unpack('V')[0]
    index += 4
    item_data = content[index, length - 8]
    index2item[index] = BinJSerializer.decode(item_data)
    index += length
  end

  items = index2item.sort_by(&:first).map(&:last)
  File.open(fname.sub(EVENT_DIR, EXTRACT_DIR).sub(/e$/, 'txt'), 'w') do |f|
    f.write items.map { |item| item + '{TR}' }.join("\n")
  end
end
