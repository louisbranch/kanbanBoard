Given /^I have set the WIP limit for a status$/ do
  @status = FactoryGirl.create(:status, :project => @project, :wip => 2)
end

When /^I set the WIP limit for a status$/ do
  @status = FactoryGirl.create(:status, :project => @project)
  visit edit_project_status_path(@project, @status)
  fill_in 'Work in Progress Limit', :with => '2'
  click_on 'Update Status'
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

