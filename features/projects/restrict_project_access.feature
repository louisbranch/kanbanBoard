Feature: Restrict Project Access
	In order to work on a private project
	As a Product Owner
	I want to restrict project access for members only
	
	Background:
		Given I'm logged in
		And a project exists
		
	Scenario: Denying access to non-members
		Given I'm not a member of this project
		Then I should not be able to access this project
