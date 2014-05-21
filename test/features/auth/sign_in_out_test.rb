require "test_helper"

feature "I want to be able to sign in and out of the website" do
  scenario "an existing user should be able to sign in" do
    visit posts_path
    click_on "Done that? Sign in"
    fill_in "Email", with: users(:editor).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    page.must_have_content("Signed in successfully")
    page.wont_have_content("Invalid email address or password")
    page.wont_have_content("Invalid email or password")
    visit posts_path
    click_on "Sign out"
    page.must_have_content("Signed out successfully")
    page.must_have_content("Sign in")
  end

  scenario "sign in with twitter works" do
   visit posts_path
   click_on "Done that? Sign in"
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   page.must_have_content "twitter.example.com, you are signed in!"
  end
end
