# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path("lib", File.dirname(__FILE__))
require 'womanizer'

Gem::Specification.new do |s|

  s.name        = "womanizer"
  s.version     = Womanizer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Niklas Hofer"]
  s.email       = ["niklas+womanizer@lanpartei.de"]
  s.homepage    = "https://github.com/niklas/womanizer"
  s.summary     = 'More women in tech'
  s.description = <<-EODES
    Allows to encode your ruby using your favourite words.

    It is similar to the Acme::Buffy, but configurable.

    Feel offended? Read the fine FAQ.
  EODES

  s.add_development_dependency 'pry', '~> 0'
  s.add_development_dependency 'libnotify', '~> 0'
  s.add_development_dependency 'rspec', '~> 0'
  s.add_development_dependency 'guard-rspec', '~> 0'
  s.add_development_dependency 'guard', '~> 0'
  s.add_development_dependency 'guard-bundler', '~> 0'

  s.has_rdoc         = false
  s.extra_rdoc_files = ["README.md"]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.files            = `git ls-files `.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths    = ["lib"]

end
