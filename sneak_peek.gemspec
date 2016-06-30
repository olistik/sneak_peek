# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sneak_peek/version'

Gem::Specification.new do |spec|
  spec.name          = "sneak_peek"
  spec.version       = SneakPeek::VERSION
  spec.authors       = ["Maurizio De Magnis"]
  spec.email         = ["root@olisti.co"]

  spec.summary       = %q{This is a utility that let's you take a look at a remote gem's readme.}
  spec.homepage      = "https://github.com/olistik/sneak_peek"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
