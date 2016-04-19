load './serializer.rb'

content = File.binread('MAA21')
index = 0
index2item = { }
while ( four = content[index, 4] )
  index += 4
  next unless four == "\x43\x00\x00\x00" or four == "\x84\x00\x00\x00"
  length = content[index, 4].unpack('v')[0]
  index += 4
  item_data = content[index, length - 8]
  index2item[index] = BinJSerializer.decode(item_data)
  index += length
end

str = index2item.sort_by(&:first).map do |i, item|
  item + "#{i}"
end.join("\n")
File.open('jp.txt', 'w') { |f| f.write str }
