# frontend develop starter

Use thees.

* jekyll (static site generator)
* scss (CSS meta lang)
* uglifier (js minify)

## Usage

    $ gem install bundler
    $ curl -L https://github.com/hokaccha/frontend-starter/tarball/master | tar vzx
    $ mv hokaccha-frontend-starter-<xxxx> <projectname>
    $ cd <projectname>
    $ bundle install
    $ rake build:all

## Directory tree

    .
    ├── Gemfile                # dependencies modules
    ├── Rakefile               # rake tasks
    ├── _config.yml            # jekyll config
    ├── _src                   # source dir
    │   ├── jekyll            # jekyll source dir
    │   │   ├── _layouts     # jekyll layout dir
    │   │   ├── css          # css output dir
    │   │   ├── js           # js output dir
    │   │   └── index.html   # default html file
    │   ├── js                # js source dir
    │   │   └── build.json   # js compile config
    │   └── scss              # scss source dir
    └── htdocs                 # jekyll output dir

## JavaScript

javascript files compile based `_src/js/build.json`.

    {
      "lib.js": [
        "lib/jquery.min.js",
        "lib/underscore-min.js",
        "lib/backbone-min.js"
      ],
      "script.js:min": [
        "script/model.js",
        "script/view.js",
        "script/main.js"
      ]
    }

Array value files is only concatenated. Key is split by `:`. It means that left side is output filename, right side is `min` or empty. When `min` is specified, output script is minified by uglifier.

## Tasks

    rake build:all     # build all files
    rake build:css     # build css files
    rake build:jekyll  # build jekyll files
    rake build:js      # build js files
    rake watch         # watch files

## License

Copyright (c) 2012 Kazuhito Hokamura
Licensed under the MIT license.
