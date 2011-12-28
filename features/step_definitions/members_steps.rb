Given /^I'm the only member of this project$/ do
  @project.users.count.should == 1
end

Given /^that this project has more 2 members$/ do
  @project.users << Factory(:user, :name => 'Foo Bar')
  @project.users << Factory(:user, :name => 'Bar Foo')
  @project.users.count.should == 3
end

Then /^I should see the member names listed for this project$/ do
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

