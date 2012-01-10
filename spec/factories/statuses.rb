FactoryGirl.define do
  factory :status do
    name "Backlog"
    wip 1
    association :project
  end
end

