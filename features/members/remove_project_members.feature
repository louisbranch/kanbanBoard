Feature: Remove Project Members
	In order to remove access from people that are not working anymore on a project 
	As a Product Owner 
	I want to remove a user from a project	

	Background:
		Given I'm logged in
		And I have a project
	
	Scenario: Remove project members
		Given that this project has another member
		When I remove this member from this project
		Then I should see only me listed for this project
	
	
