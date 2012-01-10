Given /^that this project has another member$/ do
  @user = Factory(:user, :name => 'John Doe')
  @project.users << @user
  @project.users.count.should == 2
end

Given /^I try to add a user that doesn't exist to this project$/ do
  visit project_members_path(@project)
  click_on 'Add Member'
  fill_in 'Email', :with => 'jd@gmail.com'
  click_on 'Search'
end

Given /^I have been invited to join a project$/ do
  @project = Factory(:project)
  @invitation = Factory(:invitation, :email => @user.email, :project => @project)
  @user.invitations.count.should == 1
end

When /^I remove this member from this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    click_on 'manage'
  end
  within("#member_#{@user.id}") do
    click_on 'remove'
  end
end

When /^I invite another user to join this project$/ do
  @user = Factory(:user, :name => 'John Doe', :email => 'jd@gmail.com')
  visit project_members_path(@project)
  click_on 'Add Member'
  fill_in 'Email', :with => 'jd@gmail.com'
  click_on 'Search'
  within("#member_#{@user.id}") do
    click_on 'add'
  end
end

When /^I accept this project invitation$/ do
  visit projects_path
  click_on 'Accept'
end

Then /^I should see only me listed for this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    page.should have_content 'Luiz Branco'
  end
end

Then /^I should see 2 members listed for this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    page.should have_content 'Luiz Branco'
    page.should have_content 'John Doe'
  end
end

When /^I invite her to join kanbanBoard$/ do
  page.should have_content 'jd@gmail.com was not found.'
  click_on 'Invite to kanbanBoard'
end

Then /^she should be a member of this project$/ do
  page.should have_content 'Member added!'
  @project.member?(@user).should == true
end

Then /^she should receive an invitation$/ do
  page.should have_content 'An invitation has been sent to jd@gmail.com'
end

Then /^I should be member of this project$/ do
  page.should have_content 'Project added!'
  @project.member?(@user).should == true
end

