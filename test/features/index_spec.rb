require "test_helper"

feature "Connect to the welcome page" do
  scenario"check that the text is correct" do
    visit root_path
    page.text.must_include "Alex Quel Lien"
  end
end
