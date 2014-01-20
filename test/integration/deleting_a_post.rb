require "minitest_helper"

describe "Deleting a Post" do
  it "post is deleted with a click" do
    # Given an existing post
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit post_path(post)

    # When the delete link is clicked
    click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
