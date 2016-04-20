require 'zlib'
load File.expand_path('../serializer.rb', __FILE__)

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"

EVENT_DIR = 'Event'
EXTRACT_DIR = '_extract_Event_txt'

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

  File.open(fname.sub(EVENT_DIR, EXTRACT_DIR).sub(/e$/, 'txt'), 'w') do |f|
    index2item.sort_by(&:first).map(&:last).each_with_index do |item, i|
      f.write "\nNo.#{i+1}\n"
      f.write ITEM_SPLITTER + "\n"
      f.write item + "\n"
      f.write TRAN_SPLITTER + "\n"
      f.write item + "\n"
      f.write ITEM_SPLITTER + "\n"
      f.write "\n"
    end
  end
end
