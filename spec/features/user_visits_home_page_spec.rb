require 'rails_helper'

RSpec.describe 'User visits home page' do
  context 'from root page' do
    it 'displays the home page' do
      visit root_path

      expect(page).to have_content('Welcome to the Sample App')
      expect(page).to have_link('Sign up now!')
    end
  end

  context 'from navbar' do
    it 'links from navbar link' do
      visit about_path
      click_on 'Home'

      expect(current_path).to eq(home_path)
    end

    it 'links from logo' do
      visit about_path

      within 'header' do
        click_on 'sample app'
      end

      expect(current_path).to eq(root_path)
    end
  end
end
