Feature: Update User Account
  In order to keep my information up to date
  As a forgetful chef
  I want to update my user account

  Background:
    Given I'm logged in

  Scenario: Updating my account
    When I update my account information
    Then my user account should be updated

  Scenario: Changing my password
    When I change my password
    Then I should have a new password

  Scenario: Deleting my account
    When I delete my account
    Then I should not be an user anymore
