require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)
class EventFileUtil
  EVENT_DIR = 'Event'
  EXTRACT_DIR = '_extract_Event_txt'

  def self.export_from_event( origin_format = false )
    all_items = { }

    Dir.glob("#{EVENT_DIR}/**/*.e").each do |fname|
      decompress = fname.sub(/\.e$/, '')
      gzfile = decompress + '.gz'

      FileUtils.cp(fname, gzfile)
      FileUtils.rm(decompress) if File.exists?(decompress)

      `gzip -d #{gzfile}`
      content = File.binread(decompress)
      FileUtils.rm(decompress)

      fname_key = fname.sub("#{EVENT_DIR}/", '')

      index = 0
      index2item = { }
      while ( four = content[index, 4] )
        index += 4
        next unless four == "\x43\x00\x00\x00" or four == "\x85\x00\x00\x00"
        length = content[index, 4].unpack('V')[0]
        index += 4
        item_data = content[index, length - 8]
        item = BinJSerializer.decode(item_data)
        if not origin_format
          while item[0] == '{'
            macro_end = item.index('}')
            item[0..macro_end] = ''
          end
          while item[-1] == '}'
            macro_start = item.rindex('{')
            item[macro_start..-1] = ''
          end
        end
        index2item[index] = item
        index += length - 8
      end

      items = index2item.sort_by(&:first).map(&:last)

      if not origin_format
        items.each_index do |index|
          find_index = items.index(items[index])
          if find_index < index
            items[index] = "{Duplication #{fname_key} No.#{find_index + 1}}"
          else
            other = nil
            all_items.each do |_fname, _items|
              _index = _items.index(items[index])
              if _index
                other = _fname
                find_index = _index
                break
              end
            end
            if other
              items[index] = "{Duplication #{other} No.#{find_index + 1}}"
            end
          end
        end
      end

      all_items[fname_key] = items
    end
    all_items
  end
end
