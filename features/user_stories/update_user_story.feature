Feature: Updating an User Story
	In order to change a user story information
	As a Product Owner
	I want to update an User Story

	Scenario: Updating a story
		Given an user story exists
		When I update this user story
		Then I should see this user story updated
