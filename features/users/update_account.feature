Feature: Update User Account
  In order to keep my information up to date
  As a forgetful chef
  I want to update my user account

  Scenario: Updating my account
    Given I'm logged in
    When I update my account information
    Then my user account should be updated

  Scenario: Changing my password
    Given I'm logged in
    When I change my password
    Then I should have a new password
