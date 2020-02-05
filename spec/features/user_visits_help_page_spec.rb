require 'rails_helper'

RSpec.describe 'User visits help page' do
  it 'from navbar' do
    visit root_path
    click_on 'Help'

    expect(current_path).to eq(help_path)
    expect(page).to have_selector 'h1', text: 'Help'
  end
end
