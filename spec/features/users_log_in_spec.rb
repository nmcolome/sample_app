require 'rails_helper'

RSpec.describe 'Log In' do
  before :each do
    @user = create(:user)
  end

  it 'succesfully logs in' do
    visit root_path
    click_on 'Log in'

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: @user.email
    fill_in 'session[password]', with: @user.password
    click_button 'Log in'

    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content(@user.name)
  end
end
