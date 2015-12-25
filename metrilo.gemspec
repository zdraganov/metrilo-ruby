# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metrilo/version'

Gem::Specification.new do |spec|
  spec.name          = 'metrilo'
  spec.version       = Metrilo::VERSION
  spec.authors       = ['Zhivko Draganov']
  spec.email         = ['zhivko@metrilo.com']

  spec.summary       = 'Gem for Metrilo tracking API'
  spec.description   = 'Gem for Metrilo tracking API integration. Work for both back-end and front-end tracking'
  spec.homepage      = 'https://github.com/metrilo/metrilo-ruby'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'awesome_print'
end
