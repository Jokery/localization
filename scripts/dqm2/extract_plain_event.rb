load File.expand_path('../event_file_util.rb', __FILE__)

EVENT_DIR = 'Event'
EXTRACT_DIR = '_extract_Event_txt_plain'

all_items = EventFileUtil.export_from_event(true)

all_items.each do |filename, items|
  File.open(EXTRACT_DIR + '/' + filename.sub(/e$/, 'txt'), 'w') do |f|
    f.write items.map { |item| item + '{TR}' }.join("\n")
  end
end
