require 'rails_helper'

RSpec.describe User do
  describe 'attributes' do
    it { should respond_to :name }
    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
  end
end
