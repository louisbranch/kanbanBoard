Feature: Reset User Password
  In order to receive a new password when I forget mine
  As a forgetful user
  I want to reset my password

  Background:
    Given I have an user account

  Scenario: Request a password reset
    When I request a password reset
    Then I should receive a link to reset my password

  Scenario: Reseting my password
    Given I have requested a password reset
    When I reset my password
    Then I should have a new password
