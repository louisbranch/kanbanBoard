Feature: Creating an User Story
	In order to describe a new feature for a project
	As a Product Owner
	I want to create an User Story
	
	Background:
		Given I log in
		And a project exists
		And a status system exists
	
	Scenario: Adding a story to a project
		When I create a new user story
		Then I should see this user story listed on the project backlog
	
	@javascript
	Scenario: Adding a story to a project with AJAX
		When I create a new user story
		Then I should see this user story listed on the project backlog
