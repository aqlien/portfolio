require File.expand_path('../config/application', __FILE__)
require 'rake/testtask'
#Rails.application.load_tasks
task default: 'test'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.pattern = "test/**/*_spec.rb"
end
