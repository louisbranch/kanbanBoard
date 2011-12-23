Feature: Logout
	In order to stop accessing the site
	As a Product Owner
	I want to logout
	
	Scenario: Successful logout
		Given I log in
		When I log out
		Then I should not access the site and its projects
