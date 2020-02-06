require 'rails_helper'

RSpec.describe 'Log In' do
  context 'users with an account' do
    it 'succesfully log in' do
      user = create(:user)

      visit root_path
      click_on 'Log in'

      expect(current_path).to eq(login_path)

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'Log in'

      expect(current_path).to eq(user_path(user))
    end
  end
end
