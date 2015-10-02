require 'rails_helper'
RSpec.feature "Creating exercises" do
  before do
    @john=User.create(email:"shyakaster@gmail.com",password:"password")
    login_as(@john)
  end
  scenario "with valid details" do
    visit '/'
    click_link "My Lounge"
    click_link "New WorkOut"
    expect(page).to have_link("Back")
    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Bench press"
    fill_in "Activity date", with: "2015-3-12"
    click_button "Create Exercise"
    expect(page).to have_content("Exercise has been created")

    exercise=Exercise.last
    expect(page.current_path).to eq user_exercise_path(@john, exercise)


  end
end