# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'label_definitions/version'

Gem::Specification.new do |spec|
  spec.name          = "label_definitions"
  spec.version       = LabelDefinitions::VERSION
  spec.authors       = ["Andy Stewart"]
  spec.email         = ["boss@airbladesoftware.com"]
  spec.description   = 'Open source list of label sizes.'
  spec.summary       = 'Open source list of label sizes.'
  spec.homepage      = 'https://github.com/airblade/label_definitions'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '~> 5'
  spec.add_development_dependency 'nokogiri'
end


