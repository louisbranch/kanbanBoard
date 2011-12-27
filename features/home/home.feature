Feature: kanbanBoard Overview
	In order to have a brief explanation about the service
	As a new user
	I want to have an overview on the home page
	
	Background:
		Given I'm on the home page
	
	Scenario: Service Overview
		Then I should see an brief explation about the service
	
	Scenario: Invite to login or sign up
		Then I should see how to login and sign up
