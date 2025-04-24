# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple_form-bank_account_number"
  spec.version       = "3.0.0"
  spec.authors       = ["Cédric Félizard", "Craig Watson"]
  spec.email         = ["cedric@felizard.fr", "craig@cwatson.org"]
  spec.description   = "A SimpleForm input field for bank account numbers"
  spec.summary       = "Bank account number field for SimpleForm"
  spec.homepage      = "https://github.com/craigwatson/simple_form-bank_account_number"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "simple_form", "~> 5.3"
  spec.add_dependency "virtus", "~> 1.0"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "railties"
  spec.add_development_dependency "actionpack", "~> 5.2"
end
