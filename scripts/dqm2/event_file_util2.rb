require 'fileutils'
load File.expand_path('../serializer.rb', __FILE__)
class EventFileUtil
  EVENT_DIR = 'Event'
  EXTRACT_DIR = '_extract_Event_txt'

  SKIP_MACROS = [
    '{?e3-f5}',
    '{?e3-f6}',
    '{?e3-8}',  # yinxiao
    '{?e3-3}',  # yinxiao
    '{?e3-7}',  # yinxiao
    '{?e1-48}', # kuohao

    '{?e1-4e}',
    '{?e3-9}',
    '{?e3-c}',
  ]

  COLOR_MACROS = [
    '{?e3-1c}', # bianse kaishi
    '{?0}',     # baise
    '{?2}',     # huangse
  ]

  MACROS = [
    '{?e3-f5}',
    '{?e3-f6}',
    '{?e3-8}',  # yinxiao
    '{?e1-48}', # kuohao
    '{?e1-5b}', # shengluehao
    '{?e3-3}',  # yinxiao
    '{?e3-7}',  # yinxiao
    '{?e3-1c}', # bianse kaishi
    '{?2}',     # huangse
    '{?e3-f}',  # heroname
    '{?e3-f7}', # longmowang
    '{?e3-1f}', # many space
    '{?e3-22}', # variable
    '{?e1-4a}', # shuminghao
    '{?e3-f8}',
    '{?e3-24}', # variable
    '{?e1-6f}', # wujiaoxing
    '{?0}',     # baise
    '{?e3-f4}', # mizhijieshu
    '{?e3-c}',
    '{?e3-9}'
  ]

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
          color_all_changed = false
          skip_macros = SKIP_MACROS
          while item[0] == '{'
            macro_end = item.index('}')
            if COLOR_MACROS[0] == item[0..macro_end]
              if item.scan(COLOR_MACROS[0]).length == 2 &&
                  item[item.rindex(COLOR_MACROS[0])..-1] =~ /(\{[^\}]\})*$/
                color_all_changed = true
                skip_macros += COLOR_MACROS
                item[0..macro_end] = ''
              else
                break
              end
            else
              break unless skip_macros.include? item[0..macro_end]
              item[0..macro_end] = ''
            end
          end
          while item[-1] == '}'
            macro_start = item.rindex('{')
            break unless skip_macros.include? item[macro_start..-1]
            item[macro_start..-1] = ''
          end
          if item =~ /^(\{[^\}]*\})*$/
            item = ''
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
