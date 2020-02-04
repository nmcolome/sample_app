require 'rails_helper'

RSpec.describe 'User visits static pages' do
  it 'visits root' do
    visit root_url

    expect(page).to have_content('Sample App')
  end

  it 'visits home page' do
    visit home_url

    expect(page).to have_content('Sample App')
  end

  it 'visits about page' do
    visit about_url

    expect(page).to have_content('About')
  end

  it 'visits help page' do
    visit help_url

    expect(page).to have_content('Help')
  end

  it 'visits contact page' do
    visit contact_url

    expect(page).to have_content('Contact')
  end
end
