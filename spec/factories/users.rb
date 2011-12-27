FactoryGirl.define do
  factory :user do
    name 'Luiz Branco'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'secret'
  end
end
