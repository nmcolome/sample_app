require 'rails_helper'

RSpec.describe 'User visits static pages' do
  it 'visits home page' do
    visit '/home'

    expect(page).to have_content("Sample App")
  end

  it 'visits about page' do
    visit '/about'

    expect(page).to have_content("About")
  end

  it 'visits help page' do
    visit '/help'

    expect(page).to have_content("Help")
  end
end
