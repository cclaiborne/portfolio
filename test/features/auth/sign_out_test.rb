require "test_helper"

feature("
  As a site visitor
  I want to be able to sign out of my account
  so that my data will be securely stored.
") do
  scenario "sign out" do
    visit "/"
    click_on "Sign Out"
    page.must_have_content "Login"
  end
end
