require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, show list" do
    visit posts_path
    page.must_have_content posts(:ap).body
    page.wont_have_content "No posts to display"
  end
end
