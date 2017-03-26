TRANS_DIR = '_trans_Event_txt_new'
ROLE_DIR= '_trans_role'

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"
NL = "\r\n"

role_items = { }

Dir.glob("#{ROLE_DIR}/**/*txt").each do |fname|
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
      item_lines = lines[index..end_index]

      position_line = item_lines[0]
      filename, number_str = position_line.split(' ')
      id = number_str[/\d+/].to_i

      role_items[ filename ] ||= { }
      role_items[ filename ][id] = item_lines[0..-2]

      index = end_index
    else
      index += 1
    end
  end
end

Dir.glob("#{TRANS_DIR}/**/*txt").each do |fname|
  changed = false
  updated = [ ]

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
      item_lines = lines[index..end_index]

      position_line = item_lines[0]
      filename, number_str = position_line.split(' ')
      id = number_str[/\d+/].to_i

      if role_trans = role_items[ filename ] && role_items[filename][id]
        updated.concat(role_items[filename][id])
        changed = true
      else
        updated.concat(item_lines[0..-2])
      end

      role_items[ filename ] ||= { }
      role_items[ filename ][id] = item_lines

      index = end_index
    else
      updated << lines[index]
      index += 1
    end
  end
end

