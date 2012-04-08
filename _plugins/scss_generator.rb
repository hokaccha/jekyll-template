require 'sass'

module Jekyll
  class ScssFile < StaticFile
    def initialize(dest_path, content)
      @dest_path = dest_path
      @content  = content
    end

    def destination(dest)
      File.join(dest, @dest_path)
    end

    def write(dest)
      dest_path = destination(dest)
      FileUtils.mkdir_p(File.dirname(dest_path))
      open(dest_path, 'w') {|f| f.write @content}
      true
    end
  end

  class ScssGenerator < Generator
    safe true
    priority :low

    def generate(site)
      conf = site.config['scss'] || {}
      src_dir = conf['source'] || '_scss'
      dest_dir = conf['destination'] || 'css'

      Dir.glob("#{src_dir}/[^_]*.scss") do |file_path|
        sass_engine = Sass::Engine.new(File.read(file_path), {
          :cache => conf['cache'] == nil ? true : conf['cache'],
          :cache_location => conf['cache_location'] || '.sass-cache',
          :load_paths => [src_dir],
          :syntax => :scss,
        })

        dest_filename = File.basename(file_path).sub(/\.scss$/, '.css')
        dest_path = File.join(dest_dir, dest_filename)
        site.static_files << ScssFile.new(dest_path, sass_engine.render)
      end
    end
  end
end
