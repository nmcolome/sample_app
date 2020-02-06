FactoryBot.define do
  factory :user do
    name { 'Michael Scott' }
    sequence(:email) { |n| "mscott#{n}@dundlermifflin.com" }
    password { '123456' }
  end
end
