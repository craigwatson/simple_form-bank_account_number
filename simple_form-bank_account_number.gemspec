# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "simple_form-bank_account_number"
  spec.version       = "2.0.0"
  spec.authors       = ["Cédric Félizard"]
  spec.email         = ["cedric@felizard.fr"]
  spec.description   = "A SimpleForm input field for bank account numbers"
  spec.summary       = "Bank account number field for SimpleForm"
  spec.homepage      = "https://github.com/buckybox/simple_form-bank_account_number"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "simple_form", "~> 3.0"
  spec.add_dependency "virtus", "~> 1.0"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"

  # XXX: actionpack 4.2 requires rails-html-sanitizer which has a soft dependency on Rails
  # this breaks simple_form when testing without Rails
  spec.add_development_dependency "actionpack", "~> 4.0.0"
end
