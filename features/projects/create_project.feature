Feature: Creating a Project
	In order to manage the development of a product
	As a Product Owner
	I want to create a project

	Background:
		Given I'm logged in

	Scenario: Creating a new project
		When I create a new project
		Then I should see this project listed

	Scenario: Empty Project List
		Given I don't have any projects
		Then I should see an empty project list

