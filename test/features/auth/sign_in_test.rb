require "test_helper"

feature "As a visitor, I want to sign in to my account so that I can see my previous activity." do
  scenario "SignUp" do
    #Given a reg form
    visit root_path
    click_on "Sign In"
    #When I register with valid info
    fill_in "Email", with: users(:pat).email
    fill_in "Password", with: "password"
    click_on "Sign in"
    #Then I should be signed in
    page.text.must_include "Sign Out"
    page.wont_have_content "There was a problem with your sign in"
  end

  scenario "Sign in with Twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
    # with help from https://github.com/intridea/omniauth/wiki/Integration-Testing
  end
end
