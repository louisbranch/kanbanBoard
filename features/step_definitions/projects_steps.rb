Given /^a project exists$/ do
  @project = Factory(:project)
end

When /^I create a new project$/ do
	visit projects_path
  click_on 'New Project'
  fill_in 'Name', :with => 'Agile Board'
  fill_in 'Description', :with => 'Simple agile board to track User Stories and Iterations'
  click_on 'Create Project'
end

Then /^I should see this project listed$/ do
  Project.count.should == 1
  page.should have_content 'Project Created!'
  page.should have_content 'Agile Board'
end

