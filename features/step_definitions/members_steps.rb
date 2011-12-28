Given /^I'm the only member of this project$/ do
  @project.users.count.should == 1
end

Given /^that this project has more 2 members$/ do
  @user_1 = Factory(:user, :name => 'Foo Bar')
  @user_2 = Factory(:user, :name => 'Bar Foo')
  @project.users << @user_1 << @user_2
  @project.users.count.should == 3
end

When /^I remove both members from this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    click_on 'manage'
  end
  within("#member_#{@user_1.id}") do
    click_on 'remove'
  end
  within("#member_#{@user_2.id}") do
    click_on 'remove'
  end
end

Then /^I should see 3 members listed for this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    page.should have_content 'Luiz Branco, Foo Bar, Bar Foo'
  end
end

Then /^I should see only me listed for this project$/ do
  visit projects_path
  within("#project_#{@project.id}") do
    page.should have_content 'Only me'
  end
end

