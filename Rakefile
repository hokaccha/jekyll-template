require 'uglifier'
require 'json'
require 'filewatcher'

JS_INPUT = '_src/js'
JS_OUTPUT = '_src/jekyll/js'
CSS_INPUT = '_src/scss'
CSS_OUTPUT = '_src/jekyll/css'

directory JS_INPUT
directory JS_OUTPUT
directory CSS_INPUT
directory CSS_OUTPUT

def build_js(out, files)
  out_file, build_method = out.split ':'
  is_min = build_method == 'min'
  out_path = "#{JS_OUTPUT}/#{out_file}"
  str = files.map{|f| File.read "#{JS_INPUT}/#{f}"}.join("\n")
  open(out_path, 'w') {|f| f.write str}
  puts "build #{out_path}"

  if is_min
    min_path = out_path.sub(/\.js/, '.min.js')
    min_str = Uglifier.compile(File.read(out_path)) 
    open(min_path, 'w') {|f| f.write min_str}
    puts "build #{min_path}"
  end
end

desc 'build all files'
task 'build:all' => ['build:js', 'build:css', 'build:jekyll']

desc 'build js files'
task 'build:js' => [JS_INPUT, JS_OUTPUT] do
  open "#{JS_INPUT}/build.json" do |io|
    JSON.load(io).each do |key, files| build_js(key, files) end
  end
end

desc 'build css files'
task 'build:css' => [CSS_INPUT, CSS_OUTPUT] do
  sh "sass --update #{CSS_INPUT}:#{CSS_OUTPUT}"
end

desc 'build jekyll files'
task 'build:jekyll' do
  sh "jekyll"
end

desc 'watch files'
task 'watch' => [JS_INPUT, JS_OUTPUT, CSS_INPUT, CSS_OUTPUT] do
  fork { sh "jekyll --auto --server" }
  fork { sh "sass --watch #{CSS_INPUT}:#{CSS_OUTPUT}" }

  io = open "#{JS_INPUT}/build.json"
  JSON.load(io).each do |key, files|
    fork {
      puts "watch #{key.split(':')[0]}"
      watch_files = files.map{|f| "#{JS_INPUT}/#{f}"}
      FileWatcher.new(watch_files).watch do
        build_js(key, files)
      end
    }
  end
  io.close
  Process.waitall
end
