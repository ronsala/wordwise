require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative './config/environment'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :console do #Calling this throws 'rake aborted! LoadError: cannot load such file -- nokogiri'
  Pry.start
end
