Feature: Creating an User Story
	In order to describe a new feature for a project
	As a Product Owner
	I want to create an User Story
	
	Background:
		Given I'm logged in
		And I have a project
		And a status system exists
	
	Scenario: Adding an user story to a project
		When I create a new user story
		Then I should see this user story listed on the project backlog
	
	Scenario: Adding an user story to a project without filling in the required fields
		When I try to create a new user story without filling in the required fields
		Then I should see an error message that denied the user story creation
	
	@javascript
	Scenario: Adding an user story to a project via AJAX
		When I create a new user story
		Then I should see this user story listed on the project backlog
