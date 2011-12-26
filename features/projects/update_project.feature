Feature: Updating a Project
	In order to change a project information
	As a Product Owner
	I want to update a project
	
	Background:
		Given I log in
		Given a project exists
	
	Scenario: Updating a project
		When I update this project information
		Then I should see this project information updated
	
	Scenario: Updating a project without filling in the required fields
		When I try to update a project without filling in the required fields
		Then I should see an error message that denied the project update
