Feature: Creating a Status for a Project
	In order to manage the development stages of an user story
	As a Product Owner
	I want to create a status for a project

	Background:
		Given I'm logged in
		And I have a project

	Scenario: Creating a new status
		When I create a new status
		Then I should see this status listed

