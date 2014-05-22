require "test_helper"

feature "Editing a Post" do
  scenario "changing an existing post" do
    sign_in

    visit post_path posts(:lp)
    click_on "Edit"
    fill_in "post_title", with: posts(:ap).title
    fill_in "post_body", with: posts(:ap).body
    click_on "Update Post"
    page.must_have_content posts(:ap).title
    page.must_have_content posts(:ap).body
    page.wont_have_content posts(:lp).title
    page.wont_have_content posts(:lp).body
  end
end
