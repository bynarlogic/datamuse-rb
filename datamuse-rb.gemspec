# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "datamuse_rb/version"

Gem::Specification.new do |spec|
  spec.name          = "datamuse_rb"
  spec.version       = DatamuseRB::VERSION
  spec.authors       = ["Joshua D Jarvis"]
  spec.email         = ["bynarlogic@gmail.com"]

  spec.summary       = %q{An extension to ruby strings. Adds datamuse methods to any ruby string.}
  spec.description   = %q{Extends String with datamuse functions. Datamuse https://www.datamuse.com/api/ is an open api described as a word-finding query engine for developers.}
  spec.homepage      = "https://github.com/bynarlogic/datamuse-rb"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "httparty"
  spec.add_dependency "coveralls"
end
