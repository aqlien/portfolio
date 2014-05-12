require "test_helper"

feature "Creating a Post" do
  scenario "submit form to create a new post" do
    visit new_post_path
    page.must_have_content "New post"
    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    click_on "Create Post"
    page.must_have_content posts(:ap).title
    page.must_have_content posts(:ap).body
    page.wont_have_content "New post"
  end
end
