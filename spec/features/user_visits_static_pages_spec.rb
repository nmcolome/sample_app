require 'rails_helper'

RSpec.describe 'User visits static pages' do
  it 'visits home page' do
    visit '/home'

    expect(page).to have_content("you're in the home page")
  end

  it 'visits about page' do
    visit '/about'

    expect(page).to have_content("you're in the about page")
  end

  it 'visits help page' do
    visit '/help'

    expect(page).to have_content("you're in the help page")
  end
end
