require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)

ITEM_SPLITTER = "--------------------------------------"
TRAN_SPLITTER = "======================================"

REPACK_EVENT_DIR = '_repack_Event'
EXTRACT_DIR = '_extract_Event_txt'

Dir.glob("#{EXTRACT_DIR}/**/*txt")
