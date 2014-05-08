require "test_helper"

feature "Creating a Post" do
  scenario "submit form to create a new post" do
    visit new_post_path
    page.must_have_content "New post"
    fill_in "post_title", with: "First Post!"
    fill_in "post_body", with: "Is overused but remains entertaining when used in test suites."
    click_on "Create Post"
    page.must_have_content "First Post"
    page.must_have_content "remains entertaining"
    page.wont_have_content "New post"
  end
end
