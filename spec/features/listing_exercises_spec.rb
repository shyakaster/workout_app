require 'rails_helper'

RSpec.feature "Listing exercises" do
  before do
    @john=User.create(email:"shyakaster@gmail.com",password:"password")
    login_as @john
    @e1=@john.exercises.create(duration_in_min:20, workout:"Body building",workout_date:Date.today)
    @e2=@john.exercises.create(duration_in_min:14, workout:"Body building and boxing",workout_date:Date.today)
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
end