Feature: Assigning story points to User Stories
	In order to estimate an user story effort 
	As a Product Owner 
	I want to assign story points to user stories

	Background:
		Given I'm logged in
		And an user story exists
		And a story point system exists

	Scenario: Assigning story points to a user story
		When I update this user story story points
		Then I should see this user story story points
	
	Scenario: Displaying '?' when a user story doesn't have story points
		Given this user story doesn't have story points
		Then I should see this user story story points as '?'
		
