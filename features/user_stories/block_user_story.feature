Feature: Blocking User Stories
	In order to report an issue preventing the development of an user story
	As a Product Owner
	I want to mark a user story as blocked

	Background:
		Given I'm logged in
		And an user story exists

	Scenario: Blocking an user story
		When I mark this user story as blocked
		Then I should see this user story with an issue listed

	@javascript
	Scenario: Blocking an user story using AJAX
		When I mark this user story as blocked
		Then I should see this user story with an issue listed

	Scenario: Editing an user story issue
	  Given this user story has been blocked
		When I edit this issue
		Then I should see this user story with this issue updated

	@javascript
	Scenario: Editing an user story issue using AJAX
	  Given this user story has been blocked
		When I edit this issue
		Then I should see this user story with this issue updated

	Scenario: Removing an user story issue
	  Given this user story has been blocked
		When I remove this issue
		Then I should no longer see this user story with this issue listed
