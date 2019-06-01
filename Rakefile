# frozen_string_literal: true

require "bundler/gem_tasks"
task default: :spec

desc "Run Rubocop & Fasterer"
task :cleanup do
  puts "~> bundle exec rubocop -a"
  puts `bundle exec rubocop -a`

  puts "~> bundle exec fasterer"
  puts `bundle exec fasterer`
end

desc "Generate YARD documentation"
task :doc do
  puts `bundle exec yard doc`
end
