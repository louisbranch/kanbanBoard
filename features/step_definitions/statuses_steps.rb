Given /^this project has a status$/ do
  @status = FactoryGirl.create(:status, :project => @project)
end

Given /^I have set the WIP limit for a status$/ do
  @status = FactoryGirl.create(:status, :project => @project, :wip => 2)
end

When /^I create a new status$/ do
  visit projects_path
  within("tr#project_#{@project.id}") do
    click_on 'statuses'
  end
  click_on 'Add Status'
  fill_in 'Name', :with => 'Doing'
  click_on 'Create Status'
end

When /^I update this status information$/ do
  visit project_statuses_path(@project)
  within("tr#status_#{@status.id}") do
    click_on 'Edit'
  end
  fill_in 'Name', :with => 'Done'
  click_on 'Update Status'
end

When /^I delete this status$/ do
  visit project_statuses_path(@project)
  within("tr#status_#{@status.id}") do
    click_on 'Delete'
  end
end

When /^I set the WIP limit for a status$/ do
  @status = FactoryGirl.create(:status, :project => @project)
  visit edit_project_status_path(@project, @status)
  fill_in 'Work in Progress Limit', :with => '2'
  click_on 'Update Status'
end

Then /^I should see this status listed$/ do
  page.should have_content 'Status was created!'
  page.should have_content 'Doing'
end

Then /^I should see this status information updated$/ do
  page.should have_content 'Status was updated!'
  page.should have_content 'Done'
end


Then /^I should no longer see this status$/ do
  Status.exists?(@status).should == false
  page.should have_content 'Status was deleted!'
end

Then /^I should see the WIP limit on the project board$/ do
  visit project_path(@project)
  within("td#status_#{@status.id}") do
    page.should have_content 'WIP: 2'
  end
end

Then /^I should see how many slots are available for that status$/ do
  visit projects_path
  within("tr#project_#{@project.id}") do
    within("ul.project_statuses_availability") do
      page.should have_content '2'
    end
  end
end

