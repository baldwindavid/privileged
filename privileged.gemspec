# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "privileged/version"

Gem::Specification.new do |s|
  s.name        = "privileged"
  s.version     = Privileged::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Baldwin"]
  s.email       = ["baldwindavid@gmail.com"]
  s.homepage    = "http://github.com/baldwindavid/privileged"
  s.summary     = %q{Simple, explicit permissions/authorization - supports Devise multiple role structure}
  s.description = %q{Simple, explicit permissions/authorization - supports Devise multiple role structure}

  s.rubyforge_project = "privileged"
  
  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

