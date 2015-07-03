@api
Feature: Create user account for auto-generated certificates

  Background:
    Given I want to create a certificate via the API
    And my URL autocompletes via DataKitten

  Scenario: User is created
    Given I request that the API creates a user
    And my dataset contains contact details
    When I create a certificate via the API
    Then a new user should be created
    And the API response should contain the user's email

  Scenario: Dataset has no contact details (email address)
    Given I request that the API creates a user
    And my dataset does not contain contact details
    When I create a certificate via the API
    Then the certificate should use the account that made the API request
    And the API response should contain the user's email

  Scenario: Dataset has invalid contact details
    Given I request that the API creates a user
    And my dataset does not contain contact details
    When I create a certificate via the API
    Then the certificate should use the account that made the API request
    And the API response should contain the user's email

  Scenario: New users; have multiple datasets with certificates generated by the auto-certification
    Given I request that the API creates a user
    And my dataset contains contact details
    And that email address is used for an existing user
    When I create a certificate via the API
    Then the certificate should use the existing user account
    And the API response should contain the user's email

  Scenario: User is not created when user does not request it
    Given my dataset contains contact details
    When I create a certificate via the API
    Then the certificate should use the account that made the API request
