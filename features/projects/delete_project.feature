Feature: Deleting a Project
	In order to discart an obsolete project
	As a Product Owner
	I want to delete a project
	
	Background:
		Given I log in
		And a project exists
	
	Scenario: Deleting a Project
		When I delete this project
		Then I should no longer see this project
	
	Scenario: Deleting a Project usert story
		Given this project has an user story
		When I delete this project
		Then I should no longer see this user story
