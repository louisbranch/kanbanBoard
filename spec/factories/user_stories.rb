FactoryGirl.define do
  factory :user_story do
    name "Creating an User Story"
    description "In order to describe a new feature for a project..."
    association :project
    association :status
  end
end
