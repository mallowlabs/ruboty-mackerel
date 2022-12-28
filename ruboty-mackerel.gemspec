lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruboty/mackerel/version"

Gem::Specification.new do |spec|
  spec.name          = "ruboty-mackerel"
  spec.version       = Ruboty::Mackerel::VERSION
  spec.authors       = ["mallowlabs"]
  spec.email         = ["mallowlabs@gmail.com"]
  spec.summary       = "An ruboty handler to see server status with mackerel.io"
  spec.homepage      = "https://github.com/mallowlabs/ruboty-mackerel"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "mackerel-client"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
