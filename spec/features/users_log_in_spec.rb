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

  context 'user fails to log in' do
    it 'user enters wrong email' do
      visit login_path

      fill_in 'session[email]', with: 'wrong@email.com'
      fill_in 'session[password]', with: @user.password
      click_button 'Log in'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid email/password combination')

      visit home_path

      expect(page).to_not have_content('Invalid email/password combination')
    end

    it 'user enters wrong password' do
      visit login_path

      fill_in 'session[email]', with: @user.email
      fill_in 'session[password]', with: '123'
      click_button 'Log in'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid email/password combination')
    end

    it 'does not have an account' do
      visit login_path

      fill_in 'session[email]', with: 'New User'
      fill_in 'session[password]', with: 'validPassword'
      click_button 'Log in'

      expect(current_path).to eq(login_path)
      expect(page).to have_content('Invalid email/password combination')
    end
  end
end
