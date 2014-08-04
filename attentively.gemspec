# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attentively/version'

Gem::Specification.new do |spec|
  spec.name          = "attentively"
  spec.version       = Attentively::VERSION
  spec.authors       = ["Jonathan Spies"]
  spec.email         = ["jonathan.spies@gmail.com"]
  spec.summary       = %q{Provides a simple interface to the Attentive.ly API}
  spec.description   = %q{Provides a simple interface to the Attentive.ly API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.add_dependency "faraday", "~>0.8.7"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
