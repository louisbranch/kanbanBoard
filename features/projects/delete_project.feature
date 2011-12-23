Feature: Deleting a Project
	In order to discart an obsolete project
	As a Product Owner
	I want to delete a project
	
	Background:
		Given a project exists
	
	Scenario: Deleting a Project
		When I delete this project
		Then I should no longer see this project
	
	Scenario:
		Given this project has an user story
		When I delete this project
		Then I should no longer see this user story
