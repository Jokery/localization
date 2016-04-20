content = File.binread('MAA21')
i = 0
commands = [ ]
while ( bytes = content[i * 4, 8] )
  break if bytes.nil? || bytes.length < 8

  if bytes[2, 2] == "\x00\x00" and bytes[6, 2] == "\x00\x00"
    commands << content[i * 4, 4]
    i += 8
  else
    i += 4
  end
end
count_hash = { }
commands.each do |command|
  count_hash[command] ||= 0
  count_hash[command] += 1
end

count_hash.each_key do |key|
  p key.unpack('n')[0].to_s(16) if count_hash[key] >= 2
end
