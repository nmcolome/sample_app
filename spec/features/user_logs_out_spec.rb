require 'rails_helper'

RSpec.describe 'User logs out' do
  it 'redirects user to root path' do
    user = create(:user)

    visit login_path

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_button 'Log in'
    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Log in')
    expect(page).to have_link('Sign up now!')
  end
end
