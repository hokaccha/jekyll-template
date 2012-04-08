require 'net/https'

assets = {
  # jQuery
  '_src/_js/lib/jquery.js' \
    => 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js',
  '_src/_js/lib/jquery.min.js' \
    => 'http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js',

  # Underscore.js
  '_src/_js/lib/underscore.js' \
    => 'http://documentcloud.github.com/underscore/underscore.js',
  '_src/_js/lib/underscore-min.js' \
    => 'http://documentcloud.github.com/underscore/underscore-min.js',

  # Backbone.js
  '_src/_js/lib/backbone.js' \
    => 'http://documentcloud.github.com/backbone/backbone.js',
  '_src/_js/lib/backbone-min.js' \
    => 'http://documentcloud.github.com/backbone/backbone-min.js',

  # mocha.js
  '_test/lib/mocha.js' \
    => 'https://raw.github.com/visionmedia/mocha/master/mocha.js',
  '_test/lib/mocha.css' \
    => 'https://raw.github.com/visionmedia/mocha/master/mocha.css',

  # expect.js
  '_test/lib/expect.js' \
    => 'https://raw.github.com/LearnBoost/expect.js/master/expect.js'
}

desc 'setup project'
task 'setup' do
  puts 'download assets...'
  FileUtils.mkdir_p('_src/_js/lib')
  assets.each do |filepath, url|
    puts "#{url} => #{filepath}"
    File.open(filepath, 'w') do |f|
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      if uri.port == 443
        http.use_ssl = true
      end
      f << http.start { http.get(uri.request_uri).body }
    end
  end
end

desc 'clean files'
task 'clean' do
  assets.each do |filepath, url|
    puts "remove #{filepath}"
    File.unlink filepath
  end
end
