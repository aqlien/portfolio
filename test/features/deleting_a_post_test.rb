require "test_helper"

# feature "Deleting a Post" do
#   scenario "deleting a horrible post" do
#     premade = Post.create(title: "The Worst Post", body: "LOL YOLO")
#     visit posts_path
#     puts page.body
#     page.must_have_content "Becoming a Code Fellow"
#     page.find("tbody tr:last").click_on "Destroy"
#     page.must_have_content "success"
#     visit posts_path
#     puts page.body
#     page.wont_have_content "Becoming a Code Fellow"

#   end
# end

feature "Deleting a Post" do
  scenario "deleting an existing post" do
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path
    page.must_have_content "Becoming a Code Fellow"
    page.find('tbody tr:last').click_on "Destroy"
    page.wont_have_content "Becoming a Code Fellow"
  end
end
