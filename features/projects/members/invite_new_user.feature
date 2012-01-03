Feature: Invite New Users
	In order to add people who don't have an user account yet 
	As a Product Manager 
	I want to invite people to join in the service
	
	Background:
		Given I'm logged in
		
	Scenario: Invite a new user
		Given I have a project
		And I try to add a user that doesn't exist to this project
		When I invite her to join kanbanBoard
		Then she should receive an invitation
	
	Scenario: Accepting a project invitation
		Given I'm logged in
		And I have been invited to join a project
		When I accept this project invitation
		Then I should be member of this project
