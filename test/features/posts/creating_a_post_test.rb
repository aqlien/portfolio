require "test_helper"

feature "Creating a Post" do
  scenario "submit form to create a new post" do
    sign_in(:author)

    visit new_post_path
    page.must_have_content "New post"

    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    click_on "Create Post"

    page.must_have_content posts(:ap).title
    page.must_have_content posts(:ap).body
    page.wont_have_content "New post"

    page.has_css? "#author"
    page.text.must_include users(:author).email
    page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    visit posts_path
    save_and_open_page
    page.wont_have_content "New Post"
  end
end
