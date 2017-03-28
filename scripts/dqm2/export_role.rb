TRANS_DIR = '_trans_Event_txt_new'
TRANS_ROLE_DIR = '_trans_role'

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"
ROLE_SPLITTER = "++++++++++++++++++++++++++++++++++++++"
NL = "\r\n"

outputs = [ ]
count = 0
findex = 1

Dir.glob("#{TRANS_DIR}/**/*txt").each do |fname|
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

      if item_lines.include?(ROLE_SPLITTER)
        count += 1
        outputs.concat(item_lines[0..-2])
      end

      index = end_index
      if count == 50
        File.open("#{TRANS_ROLE_DIR}/role_#{findex}.txt", 'w') { |f| f.write outputs.join(NL) }
        findex += 1
        outputs.clear
        count = 0
      end
    else
      index += 1
    end
  end
end

File.open("#{TRANS_ROLE_DIR}/role_#{findex}.txt", 'w') { |f| f.write outputs.join(NL) }
