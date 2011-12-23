Given /^a project exists$/ do
  @project = Factory(:project)
end

Given /^a project has user stories with status$/ do
  @project = Factory(:project)
  @status = Factory(:status, :name => 'Doing')
  2.times do
    Factory(:user_story, :project => @project, :status => @status)
  end
end

Given /^this project has an user story$/ do
  Factory(:user_story, :project => @project)
end

When /^I create a new project$/ do
	visit projects_path
  click_on 'New Project'
  fill_in 'Name', :with => 'Agile Board'
  fill_in 'Description', :with => 'Simple agile board to track User Stories and Iterations'
  click_on 'Create Project'
end

When /^I update this project information$/ do
  visit projects_path
  within("tr#project_1") do
    click_on 'Edit'
  end
  fill_in 'Name', :with => 'kanbanBoard'
  fill_in 'Description', :with => 'A even simpler way to track User Stories'
  click_on 'Update Project'
end

When /^I delete this project$/ do
  visit projects_path
  within("tr#project_1") do
    click_on 'Delete'
  end
end

Then /^I should see this project listed$/ do
  Project.count.should == 1
  page.should have_content 'Project Created!'
  within("tr#project_1") do
    page.should have_content 'Agile Board'
    page.should have_content 'Simple agile board to track User Stories and Iterations'
  end
end

Then /^I should see this project information updated$/ do
  page.should have_content 'Project Updated!'
  within("tr#project_1") do
    page.should have_content 'kanbanBoard'
    page.should have_content 'A even simpler way to track User Stories'
  end
end

Then /^I should no longer see this project$/ do
  Project.all.count.should == 0
  page.should have_content 'Project Deleted!'
end

Then /^I should see this project's user stories count by status$/ do
  visit projects_path
  within("tr#project_1") do
    within("td.doing") do
      page.should have_content '2'
    end
  end
end
