require "test_helper"

feature "Deleting a Post" do
    let(:title) {posts(:lp).title}
  scenario "deleting an existing post" do
    sign_in

    visit posts_path
    page.must_have_content title
    page.must_have_content posts(:ap).title
    page.find('tr', :text => title).click_on "Destroy"
    page.must_have_content posts(:ap).title
    page.wont_have_content title
  end
end
