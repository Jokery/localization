EXTRACT_DIR = '_extract_Message_txt'
TRANSLATE_DIR = '_trans_Message_txt'
FILES = [
  'msg_event.binJ.txt',
  'msg_taiseiname.binJ.txt',
  'msg_monstername.binJ.txt',
  'msg_itemname.binJ.txt',
  'msg_actionname.binJ.txt',
]

NL = "\r\n"

ITEM_SPLITTER = "--------------------------------------#{NL}"
TRAN_SPLITTER = "======================================#{NL}"

File.open('transhelp.txt', 'w') do |f|
  FILES.each do |fname|
    j_fname = EXTRACT_DIR + '/' + fname
    c_fname = TRANSLATE_DIR + '/' + fname
    jps = File.readlines(j_fname).map(&:chomp).each do |line|
      line.sub!('{TR}', '')
    end
    cns = File.readlines(c_fname).map(&:chomp).each do |line|
      line.sub!('{TR}', '')
    end
    jps.each_with_index do |jp, idx|
      cn = cns[idx]
      if jp =~ /\S/
        f.write NL
        f.write ITEM_SPLITTER
        f.write jp + NL
        f.write TRAN_SPLITTER
        f.write cn + NL
        f.write ITEM_SPLITTER
      end
    end
  end
end
