@list_restaurant
Feature: Show all Restaurant listing

  Scenario: User want to see all existing restaurant
    Given owner at homepage
    And the restaurant A exist
    And the restaurant B exist
    And the restaurant C exist
    When owner want to see all restaurant listing
    Then owner should see all restaurant listing
