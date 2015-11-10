#encoding: utf-8
EXTRA_DIR = File.expand_path('../../_extract_Message_txt', __FILE__)
TRANS_DIR = File.expand_path('../../_trans_Message_txt', __FILE__)
DICT_DIR = File.expand_path('../../dict', __FILE__)

RETURN_CODE = "{?e3-15}"
SUBS = {
  '%' => '{?e1-5e}'
}

def trans_desc(dict, namefile, descfile)
  hash = get_hash(dict)
  File.open(File.join(TRANS_DIR, "msg_#{descfile}.binJ.txt"), 'w') do |trans_file|
    names = File.readlines(File.join(EXTRA_DIR, "msg_#{namefile}.binJ.txt"))
    File.readlines(File.join(EXTRA_DIR, "msg_#{descfile}.binJ.txt")).each_with_index do |line, i|
      name = names[i][/^[^\{]*/]
      if ( in_dict = hash[name] )
        line = in_dict[:desc] + "{TR}\n"
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
        if ( in_dict = hash[name] ) && in_dict[:cn] && in_dict[:cn].strip.length != 0
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
    jp, cn, desc = line.chomp.split(',')
    SUBS.each do |k, v|
      jp.gsub!(k, v)
    end
    hash[jp] = { cn: cn, desc: desc }
  end
  hash
end
