Feature: Updating a Project
	In order to change a project information
	As a Product Owner
	I want to update a project

	Background:
		Given I'm logged in
		And I have a project

	Scenario: Updating a project
		When I update this project information
		Then I should see this project information updated

