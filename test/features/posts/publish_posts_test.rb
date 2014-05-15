require "test_helper"

feature "marking posts as published or unpublished" do
 scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Title", with: posts(:ap).title
    fill_in "Body", with: posts(:ap).body
    check "Published"
    click_on "Create Post"

    # Then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
