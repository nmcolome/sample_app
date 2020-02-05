require 'rails_helper'

RSpec.describe User do
  describe 'attributes' do
    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_confirmation_of :email }
    it { should validate_presence_of :password }
  end
end
