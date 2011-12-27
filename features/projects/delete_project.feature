Feature: Deleting a Project
	In order to discart an obsolete project
	As a Product Owner
	I want to delete a project
	
	Background:
		Given I'm logged in
		And a project exists
	
	Scenario: Deleting a Project
		When I delete this project
		Then I should no longer see this project
	
	Scenario: Deleting a Project user story
		Given this project has an user story
		When I delete this project
		Then I should no longer see this user story
