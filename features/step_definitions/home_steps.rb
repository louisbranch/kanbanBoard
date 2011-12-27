Given /^I'm on the home page$/ do
  visit root_path
end

Then /^I should see an brief explation about the service$/ do
  page.should have_content 'Visualize and manage your workflow with kanbanBoard'
  page.should have_content 'A lean tool for a lean development'
end

Then /^I should see how to login and sign up$/ do
  find_link('Login').visible?.should == true
  find_link('Sign Up').visible?.should == true
end
