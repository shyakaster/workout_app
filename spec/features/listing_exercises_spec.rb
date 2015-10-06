require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @john=User.create(first_name:"alex",last_name:"shyaka",email:"shyakaster@gmail.com",password:"password")
    @sarah=User.create(first_name:"sarah",last_name:"shyaka",email:"sarah@gmail.com",password:"password")
    login_as @john
    @e1=@john.exercises.create(duration_in_min:20, workout:"Body building",workout_date:Date.today)
    @e2=@john.exercises.create(duration_in_min:14, workout:"Body building and boxing",workout_date:Date.today)
    @following=Friendship.create(user:@john,friend:@sarah)
  end
  scenario "shows users workout for the last seven days" do
    visit '/'

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

  end
  scenario"show a list of users friends"do
    visit "/"

    click_link "My Lounge"
    expect(page).to have_content("My friends")
    expect(page).to have_content(@sarah.full_name)
    expect(page).to have_link("Unfollow")
  end
end