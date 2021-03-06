# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-mscgen/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-mscgen"
  spec.version       = Jekyll::Mscgen::VERSION
  spec.authors       = ["Wiktor Macura"]
  spec.email         = ["wmacura@gmail.com"]
  spec.description   = %q{mscgen integration for jekyll to make message sequence charts}
  spec.summary       = %q{mscgen integration for jekyll to make message sequence charts}
  spec.homepage      = "http://github.com/wkm/jekyll-mscgen"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "jekyll"
end
