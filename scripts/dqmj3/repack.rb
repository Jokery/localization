TRANSLATE_DIR = '_translate_Message_txt'
REPACK_DIR = '_repack'
IDX_DIR = '_idx'

Dir.glob('_translate_Message_txt/**/*txt').each do |fname|
  idxs = File.readlines(fname.sub(/\.txt$/, '.idx').sub(TRANSLATE_DIR, IDX_DIR)).map(&:chomp)
  items = File.readlines(fname).map(&:chomp).map { |item| item.sub(/<TR>/, '') }
  idxs.each { |item| item.sub!('<TR>', '') }
  items.each { |item| item.sub!('<TR>', '') }
  raise "#{fname} wrong line" if idxs.length != items.length
  content = [ ]
  content << [ idxs.length ].pack('I')
  idxs.length.times do 
    content << "\x00" * 4
    content << "\x01" + "\x00" * 3
  end
  p content.length
  idxs.zip(items).each do |idx, item|

  end
end
