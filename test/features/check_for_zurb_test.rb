require "test_helper"

feature "Check for Zurb stylesheet" do
  scenario "check for zurb stylesheet in the root path" do
    visit root_path
    page.html.must_include ("foundation_and_overrides.css")
  end
end
