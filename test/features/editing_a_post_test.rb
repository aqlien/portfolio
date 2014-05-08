require "test_helper"

feature "Editing a Post" do
  scenario "changing an existing post" do
    premade = Post.create(title: "Awesome Post!", body: "A dragon playing an electric guitar.")
    visit post_path(premade)
    click_on "Edit"
    fill_in "post_title", with: "An Even More Awesome Post"
    fill_in "post_body", with: "A dragon in a spaceship, rocking out on an electric guitar."
    click_on "Update Post"
    page.must_have_content "Even More Awesome"
    page.must_have_content "dragon in a spaceship"
    page.wont_have_content "dragon playing"
    page.wont_have_content "New post"
  end
end
