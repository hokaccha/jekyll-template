# frontend develop starter

Use thees.

* jekyll (static site generator)
* scss (CSS meta lang)
* uglifier (js minify)

## Usage

### install bundler

If you not installed `bundler`

    $ gem install bundler

### download and setup

    $ curl -L https://github.com/hokaccha/jekyll-template/tarball/master | tar vzx
    $ mv hokaccha-jekyll-template-<xxxx> <projectname>
    $ cd <projectname>
    $ bundle install
    $ jekyll

## Directory tree

    .
    ├── Gemfile           # dependencies modules
    ├── _config.yml       # jekyll config
    ├── _plugins          # jekyll plugins
    ├── _test             # test dir
    ├── _src              # source dir
    │   ├── _layouts     # jekyll layout dir
    │   ├── css          # css output dir
    │   ├── js           # js output dir
    │   └── index.html   # default html file
    └── htdocs            # jekyll output dir

## License

Copyright (c) 2012 Kazuhito Hokamura
Licensed under the MIT license.
