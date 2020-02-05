require 'rails_helper'

RSpec.describe 'User visits about page' do
  it 'from footer' do
    visit root_path
    click_on 'About'

    expect(current_path).to eq(about_path)
    expect(page).to have_selector 'h1', text: 'About'
  end
end
