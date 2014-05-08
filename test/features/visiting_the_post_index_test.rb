require "test_helper"

feature "Visiting the Post Index" do
  scenario "with existing posts, show list" do
    Post.create(title: "First Post!", body: "Is overused but remains entertaining when used in test suites.")
    visit posts_path
    page.must_have_content "First Post!"
    page.wont_have_content "No posts to display"
  end
end
