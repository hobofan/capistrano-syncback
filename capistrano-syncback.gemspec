# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/syncback/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-syncback"
  spec.version       = Capistrano::Syncback::VERSION
  spec.authors       = ["Maximilian Goisser"]
  spec.email         = ["goisser94@gmail.com"]
  spec.description   = %q{Capistrano Taks to sync files that changed on the server back to local}
  spec.summary       = %q{Capistrano Taks to sync files that changed on the server back to local}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
