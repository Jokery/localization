require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)
load File.expand_path('../event_file_util.rb', __FILE__)

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"
NL = "\r\n"

EVENT_DIR = 'Event'
REPACK_EVENT_DIR = '_repack_Event'
EXTRACT_DIR = '_extract_Event_txt'

HEADER_SIZE = 4100
DIALOGUE_FUNC = [
  "\x85\x00\x00\x00",
  "\x43\x00\x00\x00",
]
SKIP_FUNC = [
  "\x0c\x04\x00\x00", # "\x0c\x00\x00\x00",
  "\x09\x04\x00\x00", # "\x0c\x00\x00\x00",
  "\x0e\x04\x00\x00", # "\x0c\x00\x00\x00",
  "\x0a\x04\x00\x00", # "\x10\x00\x00\x00",
]

all_items = { }

Dir.glob("#{EXTRACT_DIR}/**/*txt").each do |fname|
  sub_dir_indicator = fname.split('/')[1] + '/'
  lines = File.readlines(fname).map(&:chomp)
  size = lines.size

  index = 0
  loop do
    break if lines[index].nil?

    if lines[index] =~ /^#{sub_dir_indicator}/
      end_index = index + 1
      while lines[end_index] !~ /^#{sub_dir_indicator}/
        if end_index >= size - 1
          break
        else
          end_index += 1
        end
      end
      item_lines = lines[index...end_index]

      position_line = item_lines[0]
      filename, number_str = position_line.split(' ')
      id = number_str[/\d+/].to_i

      trans_start = item_lines.index(TRAN_SPLITTER) + 1
      trans_end = item_lines.rindex(ITEM_SPLITTER)
      trans = item_lines[ trans_start...trans_end ].join("{?e3-15}")

      all_items[ filename ] ||= { }
      all_items[ filename ][id] = trans

      index = end_index
    else
      index += 1
    end
  end
end

origin_all_items = EventFileUtil.export_from_event

origin_all_items.each do |filename, items|
filename = 'Field/MAA21.e'
items = origin_all_items[filename]
  items.each_with_index do |item, index|
    all_items[filename] ||= { }
    all_items[filename][index+1] ||= item
  end
end

all_items.each_value do |hash|
  hash.each_key do |id|
    trans = hash[id]
    if trans.include?('{Duplication')
      _, fname, id_str = trans.split(' ')
      _id = id_str[/\d+/].to_i
      hash[id] = all_items[fname][_id]
      if hash[id].nil?
        p trans
      end
    end
  end
end

File.open('test.txt', 'w') do |f|
  f.write all_items['Field/MAA21.e'].sort_by(&:first).map(&:last).join("\n")
end

Dir.glob("#{EVENT_DIR}/**/*.e").each do |fname|
  x = all_items[fname.sub("#{EVENT_DIR}/", '')]
  next if x.nil?
  x = x.sort_by(&:first).map(&:last)

  decompress = fname.sub(/\.e$/, '')
  gzfile = decompress + '.gz'

  FileUtils.cp(fname, gzfile)
  FileUtils.rm(decompress) if File.exists?(decompress)

  `gzip -d #{gzfile}`
  content = File.binread(decompress)
  FileUtils.rm(decompress)

  arr_position2length = [ ]
  arr_pointer2position = [ ]

  index = 4
  while index < HEADER_SIZE
    if ( four = content[index, 4]) != "\xff" * 4
      point_to = four.unpack('V')[0]
      arr_pointer2position << [ index, point_to, point_to ]
    end
    index += 4
  end
  index = HEADER_SIZE
  index2item = { }
  while ( four = content[index, 4] )
    index += 4
    if DIALOGUE_FUNC.include?(four)
      length = content[index, 4].unpack('V')[0]
      arr_position2length << [ index, length ]
      index += 4
      item_data = content[index, length - 8]
      item = BinJSerializer.decode(item_data)
      index2item[index] = item
      index += length - 8
    elsif SKIP_FUNC.include?(four)
      point_to = content[index + 4, 4].unpack('V')[0]
      arr_pointer2position << [ index + 4, point_to, point_to ]
      index += 8
    end
  end

  items = index2item.sort_by(&:first).map(&:last)
  arr_position2length.sort_by!(&:first)

  replaces = [ ]

  x.each_index do |index|
    origin = items[index]
    not_macro_start = 0
    not_macro_end = -1
    while origin[not_macro_start] == '{'
      not_macro_start = origin.index('}', not_macro_start) + 1
    end
    while origin[not_macro_end] == '}'
      not_macro_end = origin.rindex('{', not_macro_end) - 1
      break if not_macro_end == -1
    end
    x[index] = origin[0...not_macro_start] + x[index] +
      ( not_macro_end != -1 ?
       origin[(not_macro_end+1)..-1] :
       '' )
      encoded = BinJSerializer.encode(x[index], utf_prefix: "\xe4", appendfix: "\x00", endmacro: "\xe3\x1b")
      length = encoded.length + 8
      position2length = arr_position2length[index]
      origin_position, origin_length = position2length
      content[origin_position, 4] = [ length ].pack('V')
      replaces << [ origin_position + 4, origin_length - 8, encoded ]
      diff = length - origin_length
      arr_pointer2position.each do |p2p|
        if ( p2p[2] + HEADER_SIZE ) > origin_position
          p2p[1] += diff
        end
      end
  end

  arr_pointer2position.each do |p2p|
    content[p2p[0], 4] = [ p2p[1] ].pack('V')
  end

  replaces.reverse_each do |pos, len, encoded|
    content[pos, len] = encoded
  end

  repack_fname = fname.sub(EVENT_DIR, REPACK_EVENT_DIR)
  decompress_repack_fname = repack_fname.sub(/\.e$/, '')
  decompress_gz_fname = decompress_repack_fname + '.gz'
  File.open(decompress_repack_fname, 'wb') { |f| f.write content }
  `gzip #{decompress_repack_fname}`
  FileUtils.mv(decompress_gz_fname, repack_fname)
end
