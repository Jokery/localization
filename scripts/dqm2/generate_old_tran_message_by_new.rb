load File.expand_path('../message_file_util.rb', __FILE__)

NL = "\r\n"

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"

TRAN_DIR = '_trans_Message_txt'
TRAN_DIR_NEW = '_trans_Message_txt_new'

all_items = { }
Dir.glob("#{TRAN_DIR_NEW}/*txt").each do |fname|
  origin_file_indicator = File.basename(fname).sub('.txt', '')
  lines = File.readlines(fname).map(&:chomp)
  size = lines.size

  index = 0
  loop do
    break if lines[index].nil?

    if lines[index] =~ /^#{origin_file_indicator}/
      end_index = index + 1
      while lines[end_index] !~ /^#{origin_file_indicator}/
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
      trans = item_lines[ trans_start...trans_end ].join("{?e3-15}") + '{TR}'

      all_items[ filename ] ||= { }
      all_items[ filename ][id] = trans

      index = end_index
    else
      index += 1
    end
  end
end

origin_all_items = MessageFileUtil.export_from_message

# fill in origin item if tran item miss; mostly Duplication
origin_all_items.each do |filename, items|
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

all_items.each do |fname, item_hash|
  File.open("#{TRAN_DIR}/#{fname}.txt", 'w') { |f| f.write item_hash.sort_by(&:first).map(&:last).join(NL) }
end
