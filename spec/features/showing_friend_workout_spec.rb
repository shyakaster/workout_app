require 'rails_helper'

RSpec.feature "Listing a friend workout" do
  before do
    @john=User.create(first_name:"John",last_name:"Doe",email:"john@example.com",password:"password")
    @peter=User.create(first_name:"Peter",last_name:"Smith",email:"peter@example.com",password:"password")
    @e1=@john.exercises.create(workout:"Johns workout",workout_date:Date.today,duration_in_min:4,)
    @e2=@peter.exercises.create(workout:"Peters workout",workout_date:Date.today,duration_in_min:7,)
    login_as @john
    @following=Friendship.create(user:@john,friend:@peter)
  end
  scenario "Show friends workout for the last 7 days" do
    visit "/"
    click_link "My Lounge"
    click_link "#{@peter.full_name}"
    expect(page).to have_content(@peter.full_name + "'s Exercises")
    expect(page).to have_content(@e2.workout)
    expect(page).to have_css("div#chart")
  end
end