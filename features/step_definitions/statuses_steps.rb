Given /^a status system exists$/ do
  @status = Factory(:status, :name => 'Backlog', :project => @project)
end

