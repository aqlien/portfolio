require "test_helper"

feature "Creating a Project" do
  scenario "fill out the form to create a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: projects(:portfolio).name
    fill_in "Technologies used", with: "Rails, Ruby, CSS"
    click_on "Create Project"
    page.text.must_include projects(:portfolio).name
    page.text.must_include "Rails"
    page.text.must_include "Project has been created"
    refute_equal(500, page.status_code, "Reached an error page.")
  end

   scenario "new project has invalid data" do
    visit projects_path
    click_on "New project"
    # Given invalid project data is entered in a form
    fill_in "Name", with: "C"
    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"
    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "something more distinctive"
    page.text.must_include "can't be blank"
  end
end
