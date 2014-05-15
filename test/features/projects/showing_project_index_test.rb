require "test_helper"

feature "viewing the index page" do
  scenario "visiting the index page" do
    visit projects_path
    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:portfolio).technologies_used
    page.text.must_include projects(:freelance).name
    page.text.must_include projects(:freelance).technologies_used
  end
end

