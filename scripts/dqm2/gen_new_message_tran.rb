ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"
NL = "\r\n"

EXTRACT_DIR_NEW = '_extract_Message_txt_new'
TRANS_DIR = '_trans_Message_txt'
TRANS_DIR_NEW = '_trans_Message_txt_new'

Dir.glob("#{EXTRACT_DIR_NEW}/*txt").each do |fname|
  translations = File.readlines(fname.sub(EXTRACT_DIR_NEW, TRANS_DIR)).map do |line|
    line.chomp.sub('{TR}', '')
  end

  origin_file_indicator = File.basename(fname).sub('.txt', '')
  lines = File.readlines(fname).map(&:chomp)
  size = lines.size
  index = 0
  replaces = [ ]
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

      replaces << [ index + trans_start, index + trans_end, translations[id-1].split("{?e3-15}")]
      index = end_index
    else
      index += 1
    end
  end

  replaces.reverse_each do |tran_start, trans_end, trans|
    lines[tran_start...trans_end] = trans
  end

  File.open(fname.sub(EXTRACT_DIR_NEW, TRANS_DIR_NEW), 'w') { |f| f.write lines.join(NL) + NL }
end
