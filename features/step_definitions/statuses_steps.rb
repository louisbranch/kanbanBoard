Given /^a status system exists$/ do
  Factory(:status, :name => 'Backlog')
  Factory(:status, :name => 'Doing')
end
