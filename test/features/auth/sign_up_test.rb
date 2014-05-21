require "test_helper"

feature "I want to sign up to my website" do
  scenario "sign up with valid info" do
    visit posts_path
    click_on "Sign up"

    fill_in "Email", with: "testy@mctesterson.com"
    fill_in "Password", with: "admin123"
    fill_in "Password confirmation", with: "admin123"

    click_on "Sign up" #should be on a new page
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "prohibited this user from being saved"
    page.wont_have_content "There was a problem with your sign up"
  end
end
