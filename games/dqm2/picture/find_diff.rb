require 'fileutils'
ORIGIN = 'origin'
REPACK = 'repack'

Dir.glob("#{REPACK}/**/*.arc").each do |fname|
  origin_fname = fname.sub(REPACK, ORIGIN)
  if (File.size(fname) - File.size(origin_fname)).abs > 10 * 1000
    FileUtils.cp(origin_fname, "/Users/joker/private/localization/navi/#{File.basename(origin_fname)}")
  end
end
