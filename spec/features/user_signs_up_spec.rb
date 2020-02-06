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

      expect(current_path).to eq(home_path)
    end
  end
end
