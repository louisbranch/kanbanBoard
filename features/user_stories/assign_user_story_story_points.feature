Feature: Assigning story points to User Stories
	In order to estimate an user story effort 
	As a Product Owner 
	I want to assign story points to user stories

	Background:
		Given an user story exists
		And a story point system exists

	Scenario:
		When I update this user story story points
		Then I should see this user story story points
