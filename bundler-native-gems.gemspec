# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler_native_gems/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-native-gems"
  spec.version       = BundlerNativeGems::VERSION
  spec.authors       = ["Caius Durling"]
  spec.email         = %w(dev@caius.name)

  spec.summary       = %{Inspect your Gemfile to list gems with native extensions}
  spec.homepage      = "https://github.com/caius/bundler-native-gems"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"

  spec.add_dependency "tty", "~> 0.4.0"
end
