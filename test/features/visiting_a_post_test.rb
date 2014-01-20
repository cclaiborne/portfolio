require "minitest_helper"

feature "Visiting a Post" do
  scenario "with existing posts" do
    #Given existing posts

    #When I visit /posts
    visit post_path(posts(:cr))

    #Then the existing posts should be loaded
    page.text.must_include "Code Rails"
  end
end
