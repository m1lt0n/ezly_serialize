
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ezly_serialize/version"

Gem::Specification.new do |spec|
  spec.name          = "ezly_serialize"
  spec.version       = EzlySerialize::VERSION
  spec.authors       = ["Pantelis Vratsalis"]
  spec.email         = ["pvratsalis@gmail.com"]

  spec.summary       = %q{EzlySerialize is a simple object serialization library}
  spec.description   = %q{Include EzlySerialize in any object you wish to serialize. EzlySerialize provides a serialize and a deserialize instance method and can be configured to use any serializer that implements an interface similar to JSON (specifically dump and load methods)}
  spec.homepage      = "https://github.com/m1lt0n/ezly_serialize"
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
end
