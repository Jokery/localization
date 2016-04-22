require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)

NL = "\r\n"

ITEM_SPLITTER = "--------------------------------------#{NL}"
TRAN_SPLITTER = "======================================#{NL}"

EVENT_DIR = 'Event'
EXTRACT_DIR = '_extract_Event_txt'

all_items = { }

Dir.glob("#{EVENT_DIR}/**/*.e").each do |fname|
  decompress = fname.sub(/\.e$/, '')
  gzfile = decompress + '.gz'

  FileUtils.cp(fname, gzfile)
  FileUtils.rm(decompress) if File.exists?(decompress)

  `gzip -d #{gzfile}`
  content = File.binread(decompress)
  FileUtils.rm(decompress)

  fname_key = fname.sub("#{EVENT_DIR}/", '')

  index = 0
  index2item = { }
  while ( four = content[index, 4] )
    index += 4
    next unless four == "\x43\x00\x00\x00" or four == "\x85\x00\x00\x00"
    length = content[index, 4].unpack('V')[0]
    index += 4
    item_data = content[index, length - 8]
    item = BinJSerializer.decode(item_data)
    item.gsub!('{?e3-15}', NL)
    index2item[index] = item
    index += length
  end

  items = index2item.sort_by(&:first).map(&:last)

  items.each_index do |index|
    find_index = items.index(items[index])
    if find_index < index
      items[index] = "{Duplication #{fname_key} No.#{find_index + 1}}"
    else
      other = nil
      all_items.each do |_fname, _items|
        _index = _items.index(items[index])
        if _index
          other = _fname
          find_index = _index
          break
        end
      end
      if other
        items[index] = "{Duplication #{other} No.#{find_index + 1}}"
      end
    end
  end

  all_items[fname_key] = items
end

all_items.group_by do |key, items|
  key.split('/')[0]
end.each do |dirname, arr|
  filenum = 1
  itemnum = 0
  f = File.open("#{EXTRACT_DIR}/#{dirname}/#{filenum}.txt", 'w')
  arr.each do |origin_filename, _items|
    _items.each_with_index do |item, i|
      if itemnum > 50
        filenum += 1
        itemnum = 0
        f.close
        f = File.open("#{EXTRACT_DIR}/#{dirname}/#{filenum}.txt", 'w')
      end
      if not item.include?('{Duplication')
        itemnum += 1
        while item[0] == '{'
          macro_end = item.index('}')
          item[0..macro_end] = ''
        end
        while item[-1] == '}'
          macro_start = item.rindex('{')
          item[macro_start..-1] = ''
        end
      end
      f.write "#{NL}#{origin_filename} No.#{i+1}#{NL}"
      f.write ITEM_SPLITTER
      f.write item + NL
      f.write TRAN_SPLITTER
      f.write item + NL
      f.write ITEM_SPLITTER
      f.write NL
    end
  end
  f.close
end
