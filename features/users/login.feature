Feature: Login
	In order to access the site and its projects
	As a Product owner
	I want to login

	Scenario: Successful login
	  Given I have an user account
		When I log in
		Then I should access the site and its projects

	Scenario: Successful logout
		Given I'm logged in
		When I log out
		Then I should not access the site and its projects
