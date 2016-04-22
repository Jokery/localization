require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)

ITEM_SPLITTER = "--------------------------------------\n"
TRAN_SPLITTER = "======================================\n"

REPACK_EVENT_DIR = '_repack_Event'
EXTRACT_DIR = '_extract_Event_txt'

all_items = { }

Dir.glob("#{EXTRACT_DIR}/**/*txt").each do |fname|
  sub_dir_indicator = fname.split('/')[1] + '/'
  lines = File.readlines(fname)
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
      trans = item_lines[ trans_start...trans_end ].join('').chomp.sub("\n", '{?e3-15}')

      all_items[ filename ] ||= { }
      all_items[ filename ][id] = trans

      index = end_index
    else
      index += 1
    end
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

x = all_items['Field/MAA21.e'].sort_by(&:first).map(&:last)
File.open('test', 'w') { |f| f.write x.map { |l| l + '{TR}' }.join("\n") }
