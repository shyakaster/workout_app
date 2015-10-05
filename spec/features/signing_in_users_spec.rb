require 'rails_helper'
RSpec.feature "Users sign in" do
  before do
    @user=User.create(first_name:"alex",last_name:"shyaka",email:"shyakaster@gmail.com",password:"password")
  end
  scenario "with valid credentials" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@user.email}")

  end
end