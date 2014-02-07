require "test_helper"

feature "Troll Comment" do
  scenario "As a site visitor I want to write a comment from a
  blog post page so that I can troll the author" do
    #Given a signed-in user
    #role = :author
    #sign_in(role)
    #Given a completed new post form
    visit new_post_comment_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    # When I submit the form
    click_on "Create Comment"
    # Then a new post should be created and displayed
    verify_post_creation(role)
  end

  scenario "As an author or author I want to approve comments
   so that my blog does not have spam comments"do
    #Given a signed in user of role author
    role = :author
    sign_in(role)
    #When I visit the comments show view of a particular post
    visit post_comments_path
    #I may approve this post
    click_on "Approve"
    end

      scenario "As an author or editor I want to approve comments
   so that my blog does not have spam comments"do
    #Given a signed in user of role author
    role = :editor
    sign_in(role)
    #When I visit the comments show view of a particular post
    visit post_comments_path
    #I may approve this post
    click_on "Approve"
    end
end
