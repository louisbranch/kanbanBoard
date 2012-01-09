Given /^an user story exists$/ do
  @project = Factory(:project)
  @user.projects << @project
  @user_story = Factory(:user_story, :project => @project)
end

Given /^this user story doesn't have story sizes$/ do
  @user_story.story_size.should == nil
end

Given /^two user stories exist on the same project and status$/ do
  @project = Factory(:project)
  @user.projects << @project
  @status_1 = Factory(:status, :name => 'Backlog')
  @status_2 = Factory(:status, :name => 'Doing')
  @user_story_1 = Factory(:user_story, :project => @project, :status => @status_1, :name => 'User Story 1')
  @user_story_2 = Factory(:user_story, :project => @project, :status => @status_1, :name => 'User Story 2')
end

Given /^(\d+) user stories exist on the same project and status$/ do |num|
  @project = Factory(:project)
  @user.projects << @project
  @status = Factory(:status)
  user_stories = FactoryGirl.create_list(:user_story, num.to_i, :project => @project, :status => @status)
end

Given /^I can only see the first (\d+) user stories$/ do |num|
  visit project_path(@project)
  find("li#user_story_#{@project.user_stories.last.id}").visible?.should == false
end

When /^I create a new user story$/ do
  visit project_path(@project)
  click_on 'New User Story'
  fill_in 'Name', :with => 'Creating an User Story'
  fill_in 'Description', :with => 'In order to describe a new feature for a project...'
  click_on 'Create User story'
end

When /^I try to create a new user story without filling in the required fields$/ do
  visit new_project_user_story_path(@project)
  fill_in 'Name', :with => ''
  fill_in 'Description', :with => ''
  click_on 'Create User story'
end

When /^I update this user story$/ do
  visit project_path(@project)
  within("li#user_story_#{@user_story.id}") do
    click_on 'Edit'
  end
  fill_in 'Name', :with => 'Updating an User Story'
  fill_in 'Description', :with => 'In order to change a user story information...'
  click_on 'Update User story'
end

When /^I try to update an user story without filling in the required fields$/ do
  visit edit_project_user_story_path(@project, @user_story)
  fill_in 'Name', :with => ''
  fill_in 'Description', :with => ''
  click_on 'Update User story'
end

When /^I update this user story story sizes$/ do
  visit edit_project_user_story_path(@project, @user_story)
  select('Small', :from => 'Story Size')
  click_on 'Update User story'
end

When /^I update this user story status$/ do
  visit edit_project_user_story_path(@project, @user_story)
  select('Doing', :from => 'Status')
  click_on 'Update User story'
end

When /^I drag and drop this user story to another status section$/ do
  visit project_path(@user_story.project)
  user_story = find("li#user_story_#{@user_story.id} header")
  new_section = find("section#doing ul")
  user_story.drag_to(new_section)
end

When /^I delete this user story$/ do
  visit project_path(@user_story.project)
  within("li#user_story_#{@user_story.id}") do
    click_on 'Delete'
  end
end

When /^I accept the confirmation to delete$/ do
  page.evaluate_script('window.confirm = function() { return true; }')
  page.driver.browser.switch_to.alert.accept
end

When /^I drag and drop the second user story to the top of the first$/ do
  visit project_path(@user_story_1.project)
  user_story_1 = find("li#user_story_#{@user_story_1.id} header")
  user_story_2 = find("li#user_story_#{@user_story_2.id} header")
  new_section = find("section#doing ul")
  user_story_2.drag_to(new_section)
  user_story_1.drag_to(new_section)
end

When /^I click to show the remaining user stories$/ do
  within("section##{@status.alias}") do
    find("li.show_more_user_stories").click
  end
end

Then /^I should see this user story listed on the project backlog$/ do
  @project.user_stories.count.should == 1
  within("section#backlog") do
    within("li#user_story_#{UserStory.first.id}") do
      page.should have_content 'Creating an User Story'
      page.should have_content 'In order to describe a new feature for a project...'
    end
  end
end

Then /^I should see an error message that denied the user story creation$/ do
  page.should have_content 'Name can\'t be blank'
  page.should have_content 'Description can\'t be blank'
end

Then /^I should see an error message that denied the user story update$/ do
  page.should have_content 'Name can\'t be blank'
  page.should have_content 'Description can\'t be blank'
end

Then /^I should see this user story updated$/ do
  within("li#user_story_#{@user_story.id}") do
    page.should have_content 'Updating an User Story'
    page.should have_content 'In order to change a user story information...'
  end
end

Then /^I should see this user story story sizes$/ do
  within("li#user_story_#{@user_story.id}") do
    page.should have_css('header.small')
    page.should have_content 'S'
  end
end

Then /^I should see this user story listed on the correct status section$/ do
  visit project_path(@user_story.project)
  @user_story.status.name.should == 'Backlog'
  within("section#doing") do
    within("li#user_story_#{@user_story.id}") do
      page.should have_content 'Creating an User Story'
      page.should have_content 'In order to describe a new feature for a project...'
    end
  end
end

Then /^I should no longer see this user story$/ do
  UserStory.exists?(@user_story).should == false
end

Then /^I should see these user stories sorted as second and first$/ do
  visit project_path(@user_story_1.project)
  page.body.should =~ /#{'User Story 2'}.*#{'User Story 1'}/m
end

Then /^I should see only the first (\d+) user stories on this status$/ do |num|
  @project.user_stories.count.should == (num.to_i + 1)
  visit project_path(@project)
  find("li#user_story_#{@project.user_stories.last.id}").visible?.should == false
end

Then /^I should see all the (\d+) user stories on this status$/ do |num|
  find("li#user_story_#{@project.user_stories.last.id}").visible?.should == true
end

Then /^I should see this user story story sizes as '\?'$/ do
  visit project_path(@project)
  within("li#user_story_#{@user_story.id}") do
    page.should have_content '?'
  end
end

