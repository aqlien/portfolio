require "test_helper"

feature "Comments on posts" do
  scenario "random user comments on a post" do
    visit post_path posts(:lp)
    fill_in "comment_content", with: comments(:com2).content
    click_on "Submit comment"
    page.must_have_content "Your comment is pending approval"
    page.text.wont_include comments(:com2).content
  end
  scenario "an editor should be able to approve the comment" do
    sign_in
    visit post_path posts(:bp1)
    click_on "Approve comment"
    page.must_have_content "Comment has been approved"
    page.text.must_include comments(:com2).content
  end
  scenario "a user should not approve comments" do
    visit post_path posts(:bp1)
    page.text.wont_include comments(:com2).content
    page.wont_have_content "Pending comments"
  end
end

