FactoryGirl.define do
  factory :issue do
    description "A problems has occured"
    association :user_story
  end
end
