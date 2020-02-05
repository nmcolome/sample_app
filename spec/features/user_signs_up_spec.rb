require 'rails_helper'

RSpec.describe 'User signs up' do
  describe 'links from home page' do
    it 'creates an account and logs in' do
      visit home_path

      click_on 'Sign up now!'

      expect(current_path).to eq('/signup')

      fill_in 'email', with: 'test@example.com'
      fill_in 'password', with: 'dummy'
      click_on 'Sign up'

      expect(current_path).to eq(home_path)
    end
  end
end
