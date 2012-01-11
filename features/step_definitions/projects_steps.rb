Given /^I don't have any projects$/ do
  @user.projects.empty?.should == true
end

Given /^I have a project$/ do
  @project = Factory(:project)
  @user.projects << @project
end

Given /^a project exists$/ do
  @project = Factory(:project)
end

Given /^a project has user stories with status$/ do
  @project = Factory(:project)
  @user.projects << @project
  @status = Factory(:status, :name => 'Doing', :project => @project)
  2.times do
    Factory(:user_story, :project => @project, :status => @status)
  end
end

Given /^this project has an user story$/ do
  Factory(:user_story, :project => @project)
end

Given /^I'm not a member of this project$/ do
  @project.member?(@user).should == false
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
  within("tr#project_#{@project.id}") do
    click_on 'edit project'
  end
  fill_in 'Name', :with => 'kanbanBoard'
  fill_in 'Description', :with => 'A even simpler way to track User Stories'
  click_on 'Update Project'
end

When /^I delete this project$/ do
  visit projects_path
  within("tr#project_#{@project.id}") do
    click_on 'delete project'
  end
end

When /^I set the WIP limit for a status$/ do
  visit edit_project_path(@project)
  within("tr#status_#{Status.first.id}") do
    select '2', :from => 'WIP'
  end
end

Then /^I should see an empty project list$/ do
  page.should have_content 'No projects yet'
end

Then /^I should see this project listed$/ do
  Project.count.should == 1
  page.should have_content 'Project Created!'
  within("tr#project_#{Project.first.id}") do
    page.should have_content 'Agile Board'
    page.should have_content 'Simple agile board to track User Stories and Iterations'
  end
end

Then /^it should have a Backlog status$/ do
  Project.first.statuses.count == 1
  visit project_path(Project.first)
  page.should have_content 'Backlog'
end

Then /^I should see this project information updated$/ do
  page.should have_content 'Project Updated!'
  within("tr#project_#{@project.id}") do
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
  within("tr#project_#{@project.id}") do
    within("ul.project_user_stories") do
      page.should have_content '2'
    end
  end
end

Then /^I should not be able to access this project$/ do
  visit project_path(@project)
  page.should have_content 'You don\'t have access to this project!'
end

