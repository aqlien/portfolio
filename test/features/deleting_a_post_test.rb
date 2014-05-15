require "test_helper"

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    visit posts_path
    page.must_have_content posts(:lp).title
    page.find('tr', :text => posts(:lp).title).click_on "Destroy"
    page.wont_have_content posts(:lp).title
  end
end
