Feature: Creating a Project
	In order to manage the development of a product
	As a Product Owner
	I want to create a project
	
	Background:
		Given I'm logged in
	
	Scenario: Creating a new project
		When I create a new project
		Then I should see this project listed
		
	Scenario: Creating a new project without filling in the required fields
		When I try to create a new project without filling in the required fields
		Then I should see an error message that denied the project creation
		
