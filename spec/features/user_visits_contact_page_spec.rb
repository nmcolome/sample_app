require 'rails_helper'

RSpec.describe 'User visits about contact' do
  it 'from footer' do
    visit root_path
    click_on 'Contact'

    expect(current_path).to eq(contact_path)
    expect(page).to have_selector 'h1', text: 'Contact'
  end
end
