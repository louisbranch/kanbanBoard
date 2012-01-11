Feature: Deleting a Status
	In order to discart an obsolete status
	As a Product Owner
	I want to delete a status

	Background:
		Given I'm logged in
		And I have a project
		And this project has a status

	Scenario: Deleting status
		When I delete this status
		Then I should no longer see this status

