When /^I log in$/ do
  visit root_path
  fill_in 'Password', :with => 'foobar'
  click_on 'Login'
  page.should have_content 'Welcome Back!'
end

When /^I log out$/ do
  click_on 'Log out'
  page.should have_content 'See you later!'
end

Then /^I should access the site and its projects$/ do
  page.should have_content 'Projects'
end

Then /^I should not access the site and its projects$/ do
  page.should have_content 'Login'
end

