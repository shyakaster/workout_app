require 'rails_helper'

RSpec.feature "Creating home page" do
  scenario "create a home page" do
    visit '/'
    expect(page).to have_content("Athletes Den")
    expect(page).to have_content "Home"
    expect(page).to have_content("Workout Lounge")
  end
end