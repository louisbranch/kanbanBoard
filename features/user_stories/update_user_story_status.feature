Feature: Update User Stories Statuses
	In order to report in which stage is an user story development
	As a Product Owner 
	I want to update user stories statuses

	Background:
		Given an user story exists
		Given a status system exists

	Scenario:
		When I update this user story status
		Then I should see this user story listed on the correct status section
