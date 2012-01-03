FactoryGirl.define do
  factory :invitation do
    association :user
    association :project
    email 'artfikan@gmail.com'
  end
end
