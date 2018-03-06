
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mapon_client/version"

Gem::Specification.new do |spec|
  spec.name          = "mapon_client"
  spec.version       = MaponClient::VERSION
  spec.authors       = ["Ingus Skaistkalns"]
  spec.email         = ["ingus.skaistkalns@gmail.com"]

  spec.summary       = %q{Ruby client library for https://www.mapon.com API}
  spec.homepage      = "https://github.com/IngusSkaistkalns/mapon_client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", ">1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
