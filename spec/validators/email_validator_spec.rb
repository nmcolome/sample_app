require 'rails_helper'

RSpec.describe EmailValidator, type: :model do

  let(:model) { User.new }
  before :each do
    @model = User.new(name: 'People Person', password: 'string')
  end

  it 'allows valid emails (according to https://en.wikipedia.org/wiki/Email_address#Examples)' do
    expect(@model).to allow_value("simple@example.com").for(:email)
    expect(@model).to allow_value("very.common@example.com").for(:email)
    expect(@model).to allow_value("disposable.style.email.with+symbol@example.com").for(:email)
    expect(@model).to allow_value("other.email-with-hyphen@example.com").for(:email)
    expect(@model).to allow_value("fully-qualified-domain@example.com").for(:email)
    expect(@model).to allow_value("user.name+tag+sorting@example.com").for(:email)
    expect(@model).to allow_value("x@example.com").for(:email)
    expect(@model).to allow_value("example-indeed@strange-example.com").for(:email)
    expect(@model).to allow_value("example@s.example").for(:email)
    expect(@model).to allow_value("\"john..doe\"@example.org").for(:email)
    expect(@model).to allow_value("mailhost!username@example.org").for(:email)
    expect(@model).to allow_value("user%example.com@example.org").for(:email)
  end

  it 'does not allow invalid emails' do
    expect(@model).to_not allow_value("Abc.example.com").for(:email)
    expect(@model).to_not allow_value("A@b@c@example.com").for(:email)
    expect(@model).to_not allow_value("admin@mailserver1").for(:email)
    expect(@model).to_not allow_value("this is\"not\\allowed@example.com").for(:email)
    expect(@model).to_not allow_value("this\ still\"not\\allowed@example.com").for(:email)
    expect(@model).to_not allow_value("1234567890123456789012345678901234567890123456789012345678901234+x@example.com").for(:email)
  end
end
