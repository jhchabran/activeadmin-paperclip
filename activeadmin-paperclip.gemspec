# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "activeadmin-paperclip/version"

Gem::Specification.new do |s|
  s.name        = "activeadmin-paperclip"
  s.version     = Activeadmin::Paperclip::VERSION
  s.authors     = ["Amos Lanka"]
  s.email       = ["amoslanka@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Adds Paperclip support to ActiveAdmin}
  s.description = %q{Adds Paperclip support to ActiveAdmin}

  s.rubyforge_project = "activeadmin-paperclip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency(%q<activeadmin>, [">= 0"])
  s.add_development_dependency(%q<shoulda>, [">= 0"])
  s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
end
