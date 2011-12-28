Feature: Remove Project Members
	In order to remove access from people that are not working anymore on a project 
	As a Product Owner 
	I want to remove a user from a project	

	Background:
		Given I'm logged in
		And I have a project
	
	Scenario: Remove project members
		Given that this project has more 2 members
		When I remove both members from this project
		Then I should see only me listed for this project
	
	
