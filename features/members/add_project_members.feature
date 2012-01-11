Feature: Add Project Members
	In order to have multiple people working on the same project 
	As a Product Owner 
	I want to add other users to a project
	
	Background:
		Given I'm logged in
		And I have a project
	
	Scenario: Adding an user to a project
		When I invite another user to join this project
		Then she should be a member of this project
