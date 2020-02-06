require 'rails_helper'

RSpec.describe 'User signs up' do
  describe 'links from home page' do
    it 'creates an account and logs in' do
      visit home_path

      click_on 'Sign up now!'

      expect(current_path).to eq('/signup')

      fill_in 'user[name]', with: 'test user'
      fill_in 'user[email]', with: 'test@example.com'
      fill_in 'user[password]', with: '123456'
      fill_in 'user[password_confirmation]', with: '123456'
      click_on 'Create my account'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content('Welcome to the Sample App!')
      expect(page).to have_content('test user')
    end

    context 'user fails validations' do
      it 'receives feedback and links back to the form' do
        user = create(:user)

        visit signup_path

        fill_in 'user[name]', with: ' '
        fill_in 'user[email]', with: user.email.upcase
        fill_in 'user[password]', with: '1234'
        fill_in 'user[password_confirmation]', with: '1234'
        click_on 'Create my account'

        expect(current_path).to eq(signup_path)
        expect(page).to have_content('Sign up')
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content('Email has already been taken')
        expect(page).to have_content('Password is too short (minimum is 6 characters)')
        expect(User.count).to eq(1)
      end
    end
  end
end
