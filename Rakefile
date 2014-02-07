require "bundler/gem_tasks"

require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
  # t.libs << 'test'
  t.pattern = 'test/*_test.rb'
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'label_definitions'
  ARGV.clear
  IRB.start
end
