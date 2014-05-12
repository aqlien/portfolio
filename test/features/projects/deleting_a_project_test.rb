require "test_helper"

feature "Delete a Project" do
  scenario "delete an existing project" do
    visit project_path(projects(:freelance))
    click_on "Destroy"
    page.text.must_include "Project has been destroyed"
    page.text.wont_include projects(:freelance).name
  end
end
