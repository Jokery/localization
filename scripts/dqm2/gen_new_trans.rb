load File.expand_path('../event_file_util.rb', __FILE__)

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"
NL = "\r\n"

EXTRACT_DIR = '_extract_Event_txt'
TRANS_DIR = '_trans_Event_txt'
TRANS_DIR_NEW = '_trans_Event_txt_new'

def gen_all_items(dir)
  all_items = { }
  Dir.glob("#{dir}/**/*txt").each do |fname|
    sub_dir_indicator = File.basename(fname).split('_')[0] + '/'
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
  all_items
end
# all_items = gen_all_items(EXTRACT_DIR)
# trans_items = gen_all_items(TRANS_DIR)
origin_all_items = EventFileUtil.export_from_event
p origin_all_items.each_value.first

