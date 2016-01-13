Dir.glob('./_trans_Message_txt/*txt').each do |filename|
  if filename =~ /msg_(.*)\.binJ/
    x = system("python3 scripts/packbinJ.py #{$1}")
    puts x unless x
  end
end
