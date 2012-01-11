Feature: Show Project Members
	In order to know who is working on the same project
	As a Product Owner
	I want to see all the project members

	Background:
		Given I'm logged in
		And I have a project

	Scenario: Show all members of a project
		Given that this project has another member
		Then I should see 2 members listed for this project

