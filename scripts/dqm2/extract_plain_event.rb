require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)

EVENT_DIR = 'Event'
EXTRACT_DIR = '_extract_Event_txt_plain'

Dir.glob("#{EVENT_DIR}/**/*.e").each do |fname|
fname = "#{EVENT_DIR}/Demo/demo036.e"
  decompress = fname.sub(/\.e$/, '')
  gzfile = decompress + '.gz'

  FileUtils.cp(fname, gzfile)
  FileUtils.rm(decompress) if File.exists?(decompress)

  `gzip -d #{gzfile}`
  content = File.binread(decompress)
  # FileUtils.rm(decompress)

  index = 0
  index2item = { }
  while ( four = content[index, 4] )
    index += 4
    next unless four == "\x43\x00\x00\x00" or four == "\x85\x00\x00\x00"
    length = content[index, 4].unpack('V')[0]
    index += 4
    item_data = content[index, length - 8]
    index2item[index] = BinJSerializer.decode(item_data)
    index += length - 8
  end

  items = index2item.sort_by(&:first).map(&:last)
  File.open(fname.sub(EVENT_DIR, EXTRACT_DIR).sub(/e$/, 'txt'), 'w') do |f|
    f.write items.map { |item| item + '{TR}' }.join("\n")
  end
end
