Feature: Updating a Project
	In order to focus on quality and faster deliveries
	As a Product Owner
	I want to limit WIP per user story statuses

	Background:
		Given I'm logged in
		And I have a project
		And a status system exists

	@wip
	Scenario: Setting a WIP limit for a status
		When I set the WIP limit for a status
		Then I should see the WIP limit on the project board

	@wip
	Scenario: Viewing available slots
		Given I have set the WIP limit for a status
		Then I should see how many slots are available for that status

	@wip
	Scenario: Viewing overload of WIP
		Given I have set the WIP limit for a status
		And I have more user stories than slots available for that status
		Then I should see that status marked as overloaded

