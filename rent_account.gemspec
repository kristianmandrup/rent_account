$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rent_account/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rent_account"
  s.version     = RentAccount::VERSION
  s.authors     = ["Kristian Mandrup"]
  s.email       = ["kmandrup@gmail.com"]
  s.homepage    = "www.danrent.dk"
  s.summary     = "Accounts for Danrent app"
  s.description = "Adds account functionality"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0.beta"
  # s.add_dependency "jquery-rails"
end
