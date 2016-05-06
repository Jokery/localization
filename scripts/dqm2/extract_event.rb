load File.expand_path('../event_file_util.rb', __FILE__)

NL = "\r\n"

ITEM_SPLITTER = "--------------------------------------#{NL}"
TRAN_SPLITTER = "======================================#{NL}"

EXTRACT_DIR = '_extract_Event_txt'

all_items = EventFileUtil.export_from_event

all_items.group_by do |key, items|
  key.split('/')[0]
end.each do |dirname, arr|
  filenum = 1
  itemnum = 0
  f = File.open("#{EXTRACT_DIR}/#{dirname}_#{filenum}.txt", 'w')
  arr.each do |origin_filename, _items|
    _items.each_with_index do |item, i|
      if itemnum > 50
        filenum += 1
        itemnum = 0
        f.close
        f = File.open("#{EXTRACT_DIR}/#{dirname}_#{filenum}.txt", 'w')
      end
      next if item.include?('{Duplication')
      item.gsub!('{?e3-15}', NL)
      itemnum += 1
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
