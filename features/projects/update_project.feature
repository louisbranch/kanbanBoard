Feature: Updating a Project
	In order to keep the project information up to date
	As a Product Owner
	I want to edit a project information
	
	Background:
		Given I log in
		Given a project exists
	
	Scenario:
		When I update this project information
		Then I should see this project information updated
	
	@javascript
	Scenario:
		When I update this project information
		Then I should see this project information updated
