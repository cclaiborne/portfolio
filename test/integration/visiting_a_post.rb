require "minitest_helper"

describe "Visiting a Post" do
  it "with existing posts" do
    #Given existing posts
    post = Post.create!(title: "Becoming a Code Fellow")
    #When I visit /posts
    visit post_path(post)
    #Then the existing posts should be loaded
    page.text.must_include "Becoming a Code Fellow"
  end
end
