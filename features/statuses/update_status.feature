Feature: Updating a Status
	In order to change a status information
	As a Product Owner
	I want to update a status

	Background:
		Given I'm logged in
		And I have a project
		And this project has a status

	Scenario: Updating a status
		When I update this status information
		Then I should see this status information updated

