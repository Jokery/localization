load File.expand_path('../message_file_util.rb', __FILE__)

NL = "\r\n"

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"

EXTRACT_DIR = '_extract_Message_txt_new'

all_items = MessageFileUtil.export_from_message

all_items.each do |fname, items|
  lines = [ ]
  items.each_with_index do |item, i|
    next if item.include?('{Duplication')
    item.gsub!('{?e3-15}', NL)

    lines.concat [
      "#{fname} No.#{i + 1}",
      ITEM_SPLITTER,
      item,
      TRAN_SPLITTER,
      item,
      ITEM_SPLITTER,
      ''
    ]
  end
  File.open("#{EXTRACT_DIR}/#{fname}.txt", 'w') { |f| f.write lines.join(NL) }
end
