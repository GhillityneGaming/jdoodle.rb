# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "jdoodle/version"

Gem::Specification.new do |s|
  s.name     = "jdoodle"
  s.summary  = "Ruby client library for JDoodle API"
  s.authors  = ["Nick Maloucaze"]
  s.email    = "nickmaloucaze@gmail.com"
  s.homepage = "https://rubygems.org/gems/jdoodle"
  s.license  = "MIT"
  s.version  = JDoodle::VERSION
  s.files    = `git ls-files -z`.split("\x0")
  
  s.require_paths = ["lib"]

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/maloucaze/jdoodlerb/issues",
    "changelog_uri" => "https://github.com/maloucaze/jdoodlerb/blob/master/CHANGELOG.md",
    "source_code_uri" => "https://github.com/maloucaze/jdoodlerb",
    "homepage_uri" => "https://rubygems.org/gems/jdoodle"
  }

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "fasterer", "~> 0.5"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "rubocop", "~> 0.70"
  s.add_development_dependency "yard", "~> 0.9"
end
