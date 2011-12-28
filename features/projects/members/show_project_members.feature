Feature: Show Project Members
	In order to know who is working on the same project 
	As a Product Owner 
	I want to see all the project members
	
	Background:
		Given I'm logged in
		And I have a project
		
	Scenario: Show all members of a project
		Given that this project has more 2 members
		Then I should see 3 members listed for this project
	
	Scenario: Show only one member of a project
		Given I'm the only member of this project
		Then I should see only me listed for this project
	
	
