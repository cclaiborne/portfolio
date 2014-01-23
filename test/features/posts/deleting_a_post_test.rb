require "test_helper"

feature "Deleting a Post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    #post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    #visit posts_path(posts(:cr))
    visit posts_path

    #name = projects(:portfolio).name

    # When the delete link is clicked
    #use css selector page.find($("a[href ='/projects/2']"))
    #page.find("a[href = '#{project_path(projects(:portfolio))}'][data-method='delete']").click
    page.find("tbody tr:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content name
  end
end
