EXTRA_DIR = File.expand_path('../../_extract_Message_txt', __FILE__)
TRANS_DIR = File.expand_path('../../_trans_Message_txt', __FILE__)
DICT_DIR = File.expand_path('../../dict', __FILE__)


def trans_desc(dict, namefile, descfile)
  hash = get_hash(dict)
  File.open(File.join(TRANS_DIR, "msg_#{descfile}.binJ.txt"), 'w') do |trans_file|
    names = File.readlines(File.join(EXTRA_DIR, "msg_#{namefile}.binJ.txt"))
    File.readlines(File.join(EXTRA_DIR, "msg_#{descfile}.binJ.txt")).each_with_index do |line, i|
      if !( line.count('{') >= 2 ) and !( names[i].count('{') >= 2 )
        name = names[i][/^[^\{]*/]
        if ( in_dict = hash[name] )
          line = in_dict[:desc] + "{TR}\n"
        end
      end
      trans_file.write line
    end
  end
end

def trans_name(dict, file)
  hash = get_hash(dict)
  File.open(File.join(TRANS_DIR, "msg_#{file}.binJ.txt"), 'w') do |trans_file|
    File.readlines(File.join(EXTRA_DIR, "msg_#{file}.binJ.txt")).each do |line|
      if not line.count('{') >= 2
        name = line[/^[^\{]*/]
        if ( in_dict = hash[name] )
          line.sub!(name, in_dict[:cn])
        end
      end
      trans_file.write line
    end
  end
end

def get_hash(dict)
  hash = { }
  File.readlines(File.join(DICT_DIR, dict)).each do |line|
    jp, cn, desc = line.split(',')
    hash[jp] = { cn: cn, desc: desc }
  end
  hash
end
