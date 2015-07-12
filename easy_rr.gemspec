# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_rr/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_rr"
  spec.version       = EasyRr::VERSION
  spec.authors       = ["David Rosillo"]
  spec.email         = ["drr538@gmail.com"]

  spec.summary       = %q{Simple gem to make round robin matches}
  spec.description   = %q{Simple gem that generates round robin matches based on a received array of participants and an amount of times they will face each other.}
  spec.homepage      = "https://github.com/mrjutsu/easy_rr"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
