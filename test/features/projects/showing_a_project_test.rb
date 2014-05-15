require "test_helper"

feature "viewing an individual project" do
  scenario "visiting the project page" do
    visit project_path projects(:portfolio)
    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:portfolio).technologies_used
    page.text.wont_include projects(:freelance).name
  end
end
