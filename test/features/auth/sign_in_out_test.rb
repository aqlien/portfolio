require "test_helper"

feature "I want to be able to sign in and out of the website" do
  scenario "an existing user should be able to sign in" do
    visit root_path
    click_on "Done that? Sign in"
    fill_in "Email", with: users(:editor).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content("Signed in successfully")
    page.wont_have_content("Invalid email address or password")
    page.wont_have_content("Invalid email or password")
    click_on "Sign out"
    page.must_have_content("Signed out successfully")
    page.must_have_content("Sign in")
  end
end
