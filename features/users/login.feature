Feature: Login
	In order to access the site and its projects
	As a Product owner
	I want to login
	
	Background:
		Given I have an user account
	
	Scenario: Successful login
		When I log in
		Then I should access the site and its projects
	
	
