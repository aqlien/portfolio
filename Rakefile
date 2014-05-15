require File.expand_path('../config/application', __FILE__)
require 'simplecov'

SimpleCov.start 'rails'

Rails.application.load_tasks
Rake::Task["test:run"].enhance ["test:features"]

Rails::TestTask.new("test:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end
