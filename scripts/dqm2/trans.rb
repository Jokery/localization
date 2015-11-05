EXTRA_DIR = File.expand_path('../../_extract_Message_txt', __FILE__)
TRANS_DIR = File.expand_path('../../_trans_Message_txt', __FILE__)

puts 123
puts EXTRA_DIR
puts 123

def trans_with_desc(dict, file)
  hash = get_hash(dict)
  trans_name = File.open(File.join(TRANS_DIR, "msg_#{file}name.binJ.txt"), 'w')
  trans_desc = File.open(File.join(TRANS_DIR, "msg_#{file}help.binJ.txt"), 'w')
end

def trans_without_desc(dict, file)
  hash = get_hash(dict)
  File.open(File.join(TRANS_DIR, "msg_#{file}.binJ.txt"), 'w') do |trans_file|
    File.readlines(File.join(EXTRA_DIR, "msg_#{file}.binJ.txt")).each do |line|
      next if line.count('{') >= 2
      name = line[/^[^\{]*/]
      if ( in_dict = hash[name] )
        line.sub!(name, in_dict[:cn])
      end
      trans_file.write line
    end
  end
end

def get_hash(dict)
  hash = { }
  File.readlines(dict).each do |line|
    jp, cn, desc = line.split(',')
    hash[jp] = { cn: cn, desc: desc }
  end
  hash
end
