require 'rails_helper'

RSpec.feature"Signing user out" do
  before do
    @john=User.create(email:"shyakaster@gmail.com",password:"password")
  end
  scenario "with valid credentials" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Log in"
  end
  scenario"sign out user" do
    visit '/'
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully")
  end
end