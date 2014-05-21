ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures  :all
end

def sign_in
  visit new_user_session_path
  fill_in "Email", with: users(:Admin).email
  fill_in "Password", with: "superpassword"
  click_on "Sign in"
end
