require "test_helper"

feature "Creating a Project" do
  scenario "fill out the form to create a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, CSS"
    click_on "Create Project"
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
    page.text.must_include "Project has been created"
    refute_equal(500, page.status_code, "Reached an error page.")
  end
end
