require "test_helper"

feature "Editing a project" do
  scenario "edit an existing project" do
    visit project_path projects(:freelance)
    click_on "Edit"
    fill_in "Technologies used", with: projects(:portfolio).technologies_used
    click_on "Update"
    page.text.must_include "Javascript"
    page.text.wont_include "Python"
  end
  scenario "incorrectly edit a project" do
    visit project_path projects(:freelance)
    click_on "Edit"
    fill_in "Name", with: "This is a really long name that would never actually be used as a project name because it reads like a book instead of a name and is way more than 150 characters"
    click_on "Update"
    page.text.must_include "writing a book"
  end
end
