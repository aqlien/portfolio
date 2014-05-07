require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit root_path
    page.must_have_content "Alex Quel Lien"
    page.wont_have_content "I am stupid"
  end
end
