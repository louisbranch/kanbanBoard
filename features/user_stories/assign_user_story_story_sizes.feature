Feature: Assigning story sizes to User Stories
	In order to estimate an user story effort 
	As a Product Owner 
	I want to assign story sizes to user stories

	Background:
		Given I'm logged in
		And an user story exists
		And a story size system exists

	Scenario: Assigning story sizes to a user story
		When I update this user story story sizes
		Then I should see this user story story sizes
	
	Scenario: Displaying '?' when a user story doesn't have story sizes
		Given this user story doesn't have story sizes
		Then I should see this user story story sizes as '?'
		
