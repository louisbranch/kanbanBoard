Feature: Sorting User Stories
	In order to organize how the user stories are displayed
	As a Product Owner
	I want to sort user stories

	Background:
		Given I'm logged in

	@javascript
	Scenario:
		Given two user stories exist on the same project and status
		When I drag and drop the second user story to the top of the first
		Then I should see these user stories sorted as second and first

