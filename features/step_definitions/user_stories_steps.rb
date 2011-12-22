Given /^an user story exists$/ do
  @user_story = Factory(:user_story)
end

When /^I create a new user story$/ do
  visit project_path(Project.first)
  click_on 'New User Story'
  fill_in 'Name', :with => 'Creating an User Story'
  fill_in 'Description', :with => 'In order to describe a new feature for a project...'
  click_on 'Create User story'
end

When /^I update this user story$/ do
  visit project_path(Project.first)
  within("li#user_story_1") do
    click_on 'Edit'
  end
  fill_in 'Name', :with => 'Updating an User Story'
  fill_in 'Description', :with => 'In order to change a user story information...'
  click_on 'Update User story'
end

When /^I update this user story story points$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select(StoryPoint.first.value, :from => 'Story Points')
  click_on 'Update User story'
end

When /^I update this user story status$/ do
  visit edit_project_user_story_path(Project.first, @user_story)
  select('Doing', :from => 'Status')
  click_on 'Update User story'
end

Then /^I should see this user story listed on the project backlog$/ do
  @project.user_stories.count.should == 1
  page.should have_content 'User Story Created!'
  within("section#backlog") do
    within("li#user_story_1") do
      page.should have_content 'Creating an User Story'
      page.should have_content 'In order to describe a new feature for a project...'
    end
  end
end

Then /^I should see this user story updated$/ do
  current_path.should == project_path(Project.first)
  page.should have_content 'User Story Updated!'
  within("li#user_story_1") do
    page.should have_content 'Updating an User Story'
    page.should have_content 'In order to change a user story information...'
  end
end
  
Then /^this user story should diplay its story points$/ do
  current_path.should == project_path(Project.first)
  within("li#user_story_1") do
    page.should have_content StoryPoint.first.value
  end
end

Then /^I should see this user story listed on the correct status section$/ do
  visit project_path(Project.first)
  within("section#doing") do
    within("li#user_story_1") do
      page.should have_content 'Creating an User Story'
      page.should have_content 'In order to describe a new feature for a project...'
    end
  end
end
