TRANSLATE_DIR = '_translate_Message_txt'
REPACK_DIR = '_repack_Message'
ITEM_NAME_DIR = '_extract_item_name'

CONVERTION = {
  "\n" => '{?e3-15}'
}

Dir.glob('_translate_Message_txt/**/*txt').each do |fname|
  item_names = File.readlines(fname.sub(/\.txt$/, '.item_name.txt').sub(TRANSLATE_DIR, ITEM_NAME_DIR)).map(&:chomp)
  items = File.readlines(fname).map(&:chomp).map { |item| item.sub(/<TR>/, '') }
  raise "#{fname} wrong line" if item_names.length != items.length

  item_names.each { |item| item.sub!('<TR>', '') }
  items.each { |item| item.sub!('<TR>', '') }
    .each do |item|
    CONVERTION.each { |k, v| item.gsub!(v, k) }
  end

  max_name_length = item_names.map(&:length).max
  name_plus = "\x00" * ( 4 - max_name_length % 4 )
  name_cons_count = ( max_name_length + name_plus.length ) / 4
  count = item_names.length
  content = [ ]
  content << [ count ].pack('I')
  count.times do
    content << "\x01" + "\x00" * 3 # name count
    content << "\x00" * 4   # name position
  end
  item_names.each_with_index do |item_name, index|
    name_position = content.length * 4
    content[ index * 2 + 1 + 1 ] = [ name_position ].pack('I')
    content << "\x00" * 4  # item position
    position = content.length
    ( item_name + name_plus ).split('').each_slice(4) do |slice|
      content << slice.join('')
    end
  end
  items.each_with_index do |item, index|
    item_position = content.length * 4
    content[ 1 + 2 * count + ( name_cons_count + 1 ) * index ] = [ item_position ].pack('I')
    item.split('').each_slice(2) do |slice|
      bindata = slice.map { |chr| chr.unpack('U').pack('v') }.join('')
      bindata += "\x00\x00" if slice.length == 1
      content << bindata
    end
    content << "\x00" * 4 if item.length % 2 == 0
  end

  File.open(fname.sub(/\.txt$/, '').sub(TRANSLATE_DIR, REPACK_DIR), 'wb') { |f| f.write content.join('') }
end
