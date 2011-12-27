Feature: Limit items for User Stories
	In order to avoid a clutter board
	As a Product Owner	
	I want to display only the first 4 user stories for each status
	
	Background:
		Given I'm logged in
	
	@javascript
	Scenario: Displaying only the first 4 user stories for each status
		Given 5 user stories exist on the same project and status
		Then I should see only the first 4 user stories on this status
	
	@javascript
	Scenario: Displaying all the user stories
		Given 5 user stories exist on the same project and status
		And I can only see the first 4 user stories
		When I click to show the remaining user stories
		Then I should see all the 5 user stories on this status
