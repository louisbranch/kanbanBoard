Feature: Updating an User Story
	In order to change a user story information
	As a Product Owner
	I want to update an user story

	Background:
		Given I'm logged in
		Given an user story exists

	Scenario: Updating an user story
		When I update this user story
		Then I should see this user story updated
		
	Scenario: Updating an user story without filling in the required fields
		When I try to update an user story without filling in the required fields
		Then I should see an error message that denied the user story update
	
	@javascript
	Scenario: Updating an user story via AJAX
		When I update this user story
		Then I should see this user story updated
