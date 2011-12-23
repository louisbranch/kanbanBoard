Feature: Show a Project's user stories count for each status
	In order to have a quick overview of a project's user stories status
	As a Product Owner
	I want to view a project's user stories count for each status
	
	Background:
		Given I log in
		Given a project has user stories with status
	
	Scenario:
		Then I should see this project's user stories count by status
